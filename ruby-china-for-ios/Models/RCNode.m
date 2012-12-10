//
//  RCNode.m
//  ruby-china
//
//  Created by NSRails autogen on 12/10/2012.
//  Copyright (c) 2012 jason. All rights reserved.
//

#import "RCNode.h"

#import "RCTopic.h"
#import "RCSection.h"
#import "RCUser.h"

@implementation RCNode
@synthesize topics, section, followers, name, sort, topicsCount, summary;

- (Class) nestedClassForProperty:(NSString *)property
{
    if ([property isEqualToString:@"topics"])
        return [RCTopic class];

    return [super nestedClassForProperty:property];
}

- (BOOL) shouldOnlySendIDKeyForNestedObjectProperty:(NSString *)property
{
    return ([property isEqualToString:@"section"] || [property isEqualToString:@"followers"]);
}

@end
