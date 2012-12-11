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
        self.backgroundColor = [UIColor blackColor];
        self.topItem.leftBarButtonItem.style = UIBarButtonItemStyleDone;
        self.topItem.rightBarButtonItem.style = UIBarButtonItemStyleDone;
        bgImage = [UIImage imageNamed:@"navbar_bg.png"];
    }
    return self;
}

- (void) drawRect:(CGRect)rect {
    [bgImage drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}

@end
