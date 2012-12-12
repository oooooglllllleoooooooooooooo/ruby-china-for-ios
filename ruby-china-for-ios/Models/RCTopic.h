//
//  RCTopic.h
//  ruby-china
//
//  Created by NSRails autogen on 12/10/2012.
//  Copyright (c) 2012 jason. All rights reserved.
//

#import "RCRemoteObject.h"

@class RCUser;
@class RCNode;
@class RCReply;

@interface RCTopic : RCRemoteObject

@property (nonatomic, strong) RCUser *user;
@property (nonatomic, strong) RCNode *node;
@property (nonatomic, strong) NSMutableArray *replies;
@property (nonatomic, strong) NSString *title, *body, *bodyHtml, *nodeName, *lastReplyUserLogin;
@property (nonatomic, strong) NSNumber *repliesCount, *lastReplyUserId, *nodeId, *hits;
@property (nonatomic, strong) NSDate *repliedAt, *createdAt, *updatedAt;

@end
