//
//  NSRRequest+Extend.m
//  ruby-china-for-ios
//
//  Created by Jason Lee on 12-12-10.
//  Copyright (c) 2012年 Ruby China. All rights reserved.
//

#import "NSRails.h"
#import "NSRRequest+Extend.h"

@implementation NSRRequest (Extend)

+ (NSRRequest *) requestToFetchObjectWithStringID:(NSString *)remoteID ofClass:(Class)aClass {
    return [[NSRRequest GET] routeToClass:aClass withCustomMethod:remoteID];
}

@end
