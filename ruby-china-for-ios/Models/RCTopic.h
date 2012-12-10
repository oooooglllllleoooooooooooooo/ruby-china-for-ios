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

@property (nonatomic, strong) RCUser *user, *lastReplyUser;
@property (nonatomic, strong) RCNode *node;
@property (nonatomic, strong) RCReply *lastReply;
@property (nonatomic, strong) NSMutableArray *replies;
@property (nonatomic, strong) NSString *title, *body, *bodyHtml, *nodeName;
@property (nonatomic, strong) NSNumber *repliesCount;
@property (nonatomic, strong) NSDate *repliedAt, *createdAt, *updatedAt;

@end
