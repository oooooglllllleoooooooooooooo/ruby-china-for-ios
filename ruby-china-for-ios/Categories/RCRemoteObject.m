//
//  NSRRequest+Extend.m
//  ruby-china-for-ios
//
//  Created by Jason Lee on 12-12-10.
//  Copyright (c) 2012年 Ruby China. All rights reserved.
//

#import "NSRails.h"
#import "RCRemoteObject.h"
#import "NSRRequest+Extend.h"

@implementation RCRemoteObject

+ (id) remoteObjectWithStringID:(NSString *)objectID error:(NSError **)error {
	NSDictionary *objData = [[NSRRequest requestToFetchObjectWithStringID:objectID ofClass:self] sendSynchronous:error];
	
    return (objData ? [self objectWithRemoteDictionary:objData] : nil);
}

+ (void) remoteObjectWithStringID:(NSString *)objectID async:(NSRFetchObjectCompletionBlock)completionBlock {
	[[NSRRequest requestToFetchObjectWithStringID:objectID ofClass:self] sendAsynchronous:
	 ^(id jsonRep, NSError *error)
	 {
         id obj = (jsonRep ? [self objectWithRemoteDictionary:jsonRep] : nil);
		 if (completionBlock)
			 completionBlock(obj, error);
	 }];
}

@end
