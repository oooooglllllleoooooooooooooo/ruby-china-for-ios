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
    [tableView reloadData];
    [self performSelectorInBackground:@selector(loadRemoteInfo:) withObject:aTopic];
}

- (void) loadRemoteInfo:(RCTopic *) aTopic {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"载入中";
    [RCTopic remoteObjectWithID:aTopic.remoteID async:^(id object, NSError *error) {
        topic = object;
        [tableView reloadData];
        [hud hide:YES];
    }];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationBar *navBar = self.navigationController.navigationBar;
    
    [navBar.backItem.backBarButtonItem setImage:[UIImage imageNamed:@"nav_back_icon"]];
    [navBar.backItem.backBarButtonItem setStyle:UIBarButtonItemStyleDone];
}


#pragma mark - TableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 300;
    }
    else {
        // Reply row
        return 100;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    else {
        // Reply row
        return [topic.replies count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        RCTopicTableViewCell *topicCell = [[RCTopicTableViewCell alloc] initWithTopic:topic
                                                                            forDetail:YES];
        return topicCell;
    }
    else {
        RCReply *reply = [topic.replies objectAtIndex:indexPath.row];
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@""];
        [cell.textLabel setText:reply.body];
        return cell;
    }
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

@end
