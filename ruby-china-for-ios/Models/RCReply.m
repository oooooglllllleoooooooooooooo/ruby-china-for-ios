//
//  RCReply.m
//  ruby-china
//
//  Created by NSRails autogen on 12/10/2012.
//  Copyright (c) 2012 jason. All rights reserved.
//

#import "RCReply.h"

#import "RCUser.h"
#import "RCTopic.h"

@implementation RCReply
@synthesize user, topic, body, bodyHtml, createdAt, updatedAt;


- (BOOL) shouldOnlySendIDKeyForNestedObjectProperty:(NSString *)property
{
    return ([property isEqualToString:@"user"] || [property isEqualToString:@"topic"]);
}

@end
