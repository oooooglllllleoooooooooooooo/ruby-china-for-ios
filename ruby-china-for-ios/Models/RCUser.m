//
//  RCUser.m
//  ruby-china
//
//  Created by NSRails autogen on 12/10/2012.
//  Copyright (c) 2012 jason. All rights reserved.
//

#import "RCUser.h"

#import "RCTopic.h"
#import "RCNote.h"
#import "RCReply.h"
#import "RCPhoto.h"
#import "RCNode.h"

static UIImage *defaultAvatarImage;

@implementation RCUser
@synthesize topics, notes, replies, email, name, twitter, location, bio, website, avatarUrl, tagline, login;

- (Class) nestedClassForProperty:(NSString *)property
{
    if ([property isEqualToString:@"topics"])
        return [RCTopic class];
    if ([property isEqualToString:@"notes"])
        return [RCNote class];
    if ([property isEqualToString:@"replies"])
        return [RCReply class];
    if ([property isEqualToString:@"photos"])
        return [RCPhoto class];

    return [super nestedClassForProperty:property];
}

+ (UIImage *) defaultAvatarImage {
    if (!defaultAvatarImage) {
        defaultAvatarImage = [UIImage imageNamed:@"default_avatar.png"];
    }
    return defaultAvatarImage;
}


@end
