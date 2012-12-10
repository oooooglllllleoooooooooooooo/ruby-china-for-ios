//
//  RCReply.h
//  ruby-china
//
//  Created by NSRails autogen on 12/10/2012.
//  Copyright (c) 2012 jason. All rights reserved.
//

#import "RCRemoteObject.h"

@class RCUser;
@class RCTopic;

@interface RCReply : RCRemoteObject

@property (nonatomic, strong) RCUser *user;
@property (nonatomic, strong) RCTopic *topic;
@property (nonatomic, strong) NSString *body, *bodyHtml;
@property (nonatomic, strong) NSDate *createdAt, *updatedAt;

@end
