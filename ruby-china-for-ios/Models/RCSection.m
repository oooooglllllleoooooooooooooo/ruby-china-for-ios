//
//  RCSection.m
//  ruby-china
//
//  Created by NSRails autogen on 12/10/2012.
//  Copyright (c) 2012 jason. All rights reserved.
//

#import "RCSection.h"

#import "RCNode.h"

@implementation RCSection
@synthesize nodes, name, sort;

- (Class) nestedClassForProperty:(NSString *)property
{
    if ([property isEqualToString:@"nodes"])
        return [RCNode class];

    return [super nestedClassForProperty:property];
}

@end
