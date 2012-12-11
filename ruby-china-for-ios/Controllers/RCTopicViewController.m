//
//  RCTopicViewController.m
//  ruby-china-for-ios
//
//  Created by Jason Lee on 12-12-10.
//  Copyright (c) 2012年 Ruby China. All rights reserved.
//

#import "RCTopicViewController.h"
#import "RCTopicTableViewCell.h"
#import "RCAll.h"
#import <MBProgressHUD.h>
#import "RCNavigationBar.h"
#import <MHPrettyDate.h>

#define kTopicDetailFileName @"topic_detail.html"

static RCTopicViewController *sharedInstance;

@implementation RCTopicViewController

@synthesize topic;

+ (RCTopicViewController *) sharedInstance {
    if (!sharedInstance) {
        sharedInstance = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"RCTopicViewController"];
    }
    
    return sharedInstance;
}

- (void)setTopic:(RCTopic *) aTopic {
    topic = aTopic;
    [self performSelectorInBackground:@selector(loadRemoteInfo:) withObject:aTopic];
}

- (void) loadRemoteInfo:(RCTopic *) aTopic {
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    hud.mode = MBProgressHUDModeIndeterminate;
//    hud.labelText = @"载入中";
    [RCTopic remoteObjectWithID:aTopic.remoteID async:^(id object, NSError *error) {
        topic = object;
        [self setupWebView];
//        [hud hide:YES];
    }];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationBar *navBar = self.navigationController.navigationBar;
    
    [navBar.backItem.backBarButtonItem setImage:[UIImage imageNamed:@"nav_back_icon"]];
    [navBar.backItem.backBarButtonItem setStyle:UIBarButtonItemStyleDone];
    
    webView.backgroundColor = [UIColor clearColor];
}

- (void) setupWebView {
    NSString *html = [self readTemplate:@"topic_detail"];
    NSString *_replyTemplate = [self readTemplate:@"_reply"];
    
    html = [self replaceHtml:html forKey:@"bundle_path" value:[[NSBundle mainBundle] resourcePath]];
    html = [self replaceHtml:html forKey:@"title" value:topic.title];
    html = [self replaceHtml:html forKey:@"body_html" value:topic.bodyHtml];
    html = [self replaceHtml:html forKey:@"user_login" value:topic.user.login];
    html = [self replaceHtml:html forKey:@"user_avatar_url" value:topic.user.avatarUrl];
    html = [self replaceHtml:html forKey:@"node_id" value:topic.nodeId];
    html = [self replaceHtml:html forKey:@"node_name" value:topic.nodeName];
    html = [self replaceHtml:html forKey:@"last_reply_user_login" value:topic.lastReplyUserLogin];
    html = [self replaceHtml:html forKey:@"replied_at" value:topic.repliedAt];
    html = [self replaceHtml:html forKey:@"hits" value:@""];
    html = [self replaceHtml:html forKey:@"replies_count" value:topic.repliesCount];
    
    NSMutableArray *replies = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < topic.replies.count; i ++) {
        RCReply *reply = [topic.replies objectAtIndex:i];
        NSString *replyHtml = [_replyTemplate copy];
        
        NSNumber *floor = [NSNumber numberWithInt:(i + 1)];
        
        replyHtml = [self replaceHtml:replyHtml forKey:@"floor" value:floor];
        replyHtml = [self replaceHtml:replyHtml forKey:@"reply.id" value:reply.remoteID];
        replyHtml = [self replaceHtml:replyHtml forKey:@"reply.user_login" value:reply.user.login];
        replyHtml = [self replaceHtml:replyHtml forKey:@"reply.user_avatar_url" value:reply.user.avatarUrl];
        replyHtml = [self replaceHtml:replyHtml forKey:@"reply.created_at" value:reply.createdAt];
        replyHtml = [self replaceHtml:replyHtml forKey:@"reply.body_html" value:reply.bodyHtml];
        
        [replies addObject:replyHtml];
    }
    
    html = [self replaceHtml:html forKey:@"replies_collection" value:[replies componentsJoinedByString:@"\n"]];
    
    NSLog(@"%@",html);
    
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    [webView loadHTMLString:html baseURL:baseURL];
}

- (NSString *) readTemplate: (NSString *)fileName {
    return [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:@"html"] encoding:NSUTF8StringEncoding error:NULL];
}

- (NSString *) replaceHtml:(NSString *)html forKey:(NSString *)key value:(id)value {
    if (!value) {
        return html;
    }
    
    NSString *stringValue = @"";
    if ([value isKindOfClass:[NSString class]]) {
        stringValue = value;
    }
    else if ([value isKindOfClass:[NSNumber class]]) {
        stringValue = [value stringValue];
    }
    else if ([value isKindOfClass:[NSDate class]]) {
        stringValue = [MHPrettyDate prettyDateFromDate:value
                                            withFormat:MHPrettyDateFormatWithTime];
    }

    
    key = [NSString stringWithFormat:@"{{%@}}",key];
    html = [html stringByReplacingOccurrencesOfString:key withString:stringValue];
    return html;
}
@end
