//
//  SCNavigationBar.m
//  ExampleNavBarBackground
//
//  Created by Sebastian Celis on 3/1/2012.
//  Copyright 2012-2012 Sebastian Celis. All rights reserved.
//

#import "RCNavigationBar.h"

@implementation RCNavigationBar

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        self.topItem.leftBarButtonItem.style = UIBarButtonItemStyleDone;
        self.topItem.rightBarButtonItem.style = UIBarButtonItemStyleDone;
    }
    return self;
}


@end
