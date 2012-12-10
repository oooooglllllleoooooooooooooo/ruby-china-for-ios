//
//  RCPhoto.h
//  ruby-china
//
//  Created by NSRails autogen on 12/10/2012.
//  Copyright (c) 2012 jason. All rights reserved.
//

#import "RCRemoteObject.h"

@class RCUser;

@interface RCPhoto : RCRemoteObject

@property (nonatomic, strong) RCUser *user;
@property (nonatomic, strong) NSString *title, *imageFileName;
@property (nonatomic, strong) NSNumber *imageFileSize;
@property (nonatomic, strong) NSDate *createdAt, *updatedAt;

@end
