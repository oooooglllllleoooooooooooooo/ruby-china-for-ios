//
//  NSRRequest+Extend.h
//  ruby-china-for-ios
//
//  Created by Jason Lee on 12-12-10.
//  Copyright (c) 2012年 Ruby China. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSRRequest (Extend)
+ (NSRRequest *) requestToFetchObjectWithStringID:(NSString *)remoteID ofClass:(Class)aClass;
@end
