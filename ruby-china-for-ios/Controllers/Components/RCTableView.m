//
//  RCTableView.m
//  ruby-china-for-ios
//
//  Created by Jason Lee on 12-12-10.
//  Copyright (c) 2012年 Ruby China. All rights reserved.
//

#import "RCTableView.h"
#import <QuartzCore/QuartzCore.h>

@implementation RCTableView

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        bgImage = [UIImage imageNamed:@"bg.png"];
        self.separatorColor = [UIColor clearColor];
    }
    return self;
}

- (void) drawRect:(CGRect)rect {
    [bgImage drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [super drawRect:rect];
}

@end
