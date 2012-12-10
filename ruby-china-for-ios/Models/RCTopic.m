//
//  RCTopic.m
//  ruby-china
//
//  Created by NSRails autogen on 12/10/2012.
//  Copyright (c) 2012 jason. All rights reserved.
//

#import "RCTopic.h"

#import "RCUser.h"
#import "RCNode.h"
#import "RCReply.h"

@implementation RCTopic
@synthesize user, node, lastReplyUser, lastReply, replies, title, body, bodyHtml, repliesCount, repliedAt, createdAt, updatedAt;

- (Class) nestedClassForProperty:(NSString *)property
{
    if ([property isEqualToString:@"replies"])
        return [RCReply class];

    return [super nestedClassForProperty:property];
}

- (BOOL) shouldOnlySendIDKeyForNestedObjectProperty:(NSString *)property
{
    return ([property isEqualToString:@"user"] || [property isEqualToString:@"node"] || [property isEqualToString:@"lastReplyUser"] || [property isEqualToString:@"lastReply"]);
}

@end
