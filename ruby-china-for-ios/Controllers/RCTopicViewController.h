//
//  RCTopicViewController.h
//  ruby-china-for-ios
//
//  Created by Jason Lee on 12-12-10.
//  Copyright (c) 2012年 Ruby China. All rights reserved.
//

#import "RCViewController.h"

@class RCTopic;

@interface RCTopicViewController : RCViewController <UIWebViewDelegate>  {
    RCTopic *topic;
    IBOutlet UIWebView *webView;
}

+ (RCTopicViewController *) sharedInstance;

@property (nonatomic, strong) RCTopic *topic;
@end
