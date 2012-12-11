//
//  RCNavLeftRightButtonItem.m
//  ruby-china-for-ios
//
//  Created by Jason Lee on 12-12-11.
//  Copyright (c) 2012年 Ruby China. All rights reserved.
//

#import "RCNavLeftRightButtonItem.h"

@implementation RCNavLeftRightButtonItem

- (id) initWithNavBar:(UINavigationBar *)navBar leftRight:(RCNavLeftRightButtonItemType)buttonType withButtonImage:(UIImage *)image withTarget:(id)target withSelector:(SEL)selector {

    CGRect viewFrame = CGRectMake(navBar.frame.size.width - 45, 0, 45, 47);
    if (buttonType == RCNavLeftRightButtonItemTypeLeft) {
        viewFrame.origin.x = 0;
    }
    UIView *buttonView = [[UIView alloc] initWithFrame:viewFrame];
        
    CGRect buttonRect = CGRectMake(buttonView.frame.size.width - 30, (47 - 24) / 2, 24, 24);
    if (buttonType == RCNavLeftRightButtonItemTypeLeft) {
        buttonRect.origin.x = 5;
    }
    UIButton *refreshButton = [[UIButton alloc] initWithFrame:buttonRect];
    [refreshButton setImage:image forState:UIControlStateNormal];
    [refreshButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [buttonView addSubview:refreshButton];
    
    self = [super initWithCustomView:buttonView];
    
    if (self) {
        if (buttonType == RCNavLeftRightButtonItemTypeLeft) {
            navBar.topItem.leftBarButtonItem = self;
        }
        else {
            navBar.topItem.rightBarButtonItem = self;
        }
    }
    return self;
}

@end
