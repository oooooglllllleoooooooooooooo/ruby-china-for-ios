//
//  RCSection.h
//  ruby-china
//
//  Created by NSRails autogen on 12/10/2012.
//  Copyright (c) 2012 jason. All rights reserved.
//

#import "RCRemoteObject.h"

@class RCNode;

@interface RCSection : RCRemoteObject

@property (nonatomic, strong) NSMutableArray *nodes;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *sort;

@end
