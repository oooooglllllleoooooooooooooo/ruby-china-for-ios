//
//  RCPhoto.m
//  ruby-china
//
//  Created by NSRails autogen on 12/10/2012.
//  Copyright (c) 2012 jason. All rights reserved.
//

#import "RCPhoto.h"

#import "RCUser.h"

@implementation RCPhoto
@synthesize user, title, imageFileName, imageFileSize, createdAt, updatedAt;

- (BOOL) shouldOnlySendIDKeyForNestedObjectProperty:(NSString *)property
{
    return [property isEqualToString:@"user"];
}

@end
