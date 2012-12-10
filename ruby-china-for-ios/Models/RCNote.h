//
//  RCNote.h
//  ruby-china
//
//  Created by NSRails autogen on 12/10/2012.
//  Copyright (c) 2012 jason. All rights reserved.
//

#import "RCRemoteObject.h"

@class RCUser;

@interface RCNote : RCRemoteObject

@property (nonatomic, strong) RCUser *user;
@property (nonatomic, strong) NSString *title, *body;
@property (nonatomic, strong) NSNumber *wordCount, *changesCout;
@property (nonatomic, strong) NSDate *createdAt, *updatedAt;

@end
