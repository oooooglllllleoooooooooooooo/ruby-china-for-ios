//
//  NSRRequest+Extend.h
//  ruby-china-for-ios
//
//  Created by Jason Lee on 12-12-10.
//  Copyright (c) 2012年 Ruby China. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSRails.h"
#import "NSRRemoteObject.h"

@interface RCRemoteObject : NSRRemoteObject {
    
}
/**
 Returns an instance of receiver's class corresponding to the remote object with that ID.
 
 Makes a GET request to `/objects/1` (where `objects` is the pluralization of receiver's model name, and `1` is *objectID*
 
 Request made synchronously. See `<remoteObjectWithID:async:>` for asynchronous operation.
 
 @param objectID The ID of the remote object.
 @param error Out parameter used if an error occurs while processing the request. May be `NULL`.
 @return Instance of receiver's class with properties from the remote object with that ID.
 */
+ (id) remoteObjectWithStringID:(NSString *)objectID error:(NSError **)error;

/**
 Retrieves an instance receiver's class corresponding to the remote object with that ID.
 
 Asynchronously makes a GET request to `/objects/1` (where `objects` is the pluralization of receiver's model name, and `1` is *objectID*)
 
 @param objectID The ID of the remote object.
 @param completionBlock Block to be executed when the request is complete.
 */
+ (void) remoteObjectWithStringID:(NSString *)objectID async:(NSRFetchObjectCompletionBlock)completionBlock;

@end
