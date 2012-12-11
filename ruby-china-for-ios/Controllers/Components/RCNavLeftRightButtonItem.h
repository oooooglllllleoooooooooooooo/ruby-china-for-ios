//
//  RCNavLeftRightButtonItem.h
//  ruby-china-for-ios
//
//  Created by Jason Lee on 12-12-11.
//  Copyright (c) 2012年 Ruby China. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, RCNavLeftRightButtonItemType) {
    RCNavLeftRightButtonItemTypeLeft = 0,
    RCNavLeftRightButtonItemTypeRight
};

@interface RCNavLeftRightButtonItem : UIBarButtonItem {
    
}


- (id) initWithNavBar:(UINavigationBar *)navBar leftRight:(RCNavLeftRightButtonItemType)buttonType withButtonImage:(UIImage *)image withTarget:(id)target withSelector:(SEL)selector;

@end
