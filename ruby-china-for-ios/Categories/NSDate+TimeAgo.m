//
//  NSDate+TimeAgo.m
//  ruby-china-for-ios
//
//  Created by Jason Lee on 12-12-12.
//  Copyright (c) 2012年 Ruby China. All rights reserved.
//

#import "NSDate+TimeAgo.h"

@implementation NSDate (TimeAgo)

- (NSString *) timeAgo {
    NSString *dateString;
    
    NSLog(@"timeAgo date: %@", self);
    
    // handle future date cases
    int days = [self daysFromNow];
    if (days > 200) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM-dd";
        dateString = [formatter stringFromDate:self];
    }
    else if (days > 31) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"MM月dd日";
        dateString = [formatter stringFromDate:self];
    }
    else if (days == 0)  {
        if ([self hoursFromNow] == 0) {
            // if within 60 minutes print minutes
            NSInteger minutes = [self minutesFromNow];
            
            if (minutes == 0) {
                dateString = @"刚刚";
            }
            else {
                dateString = [NSString stringWithFormat: @"%d分钟前", minutes];
            }
        }
        else {
            // else print hours
            NSInteger hours = [self hoursFromNow];            
            dateString = [NSString stringWithFormat: @"%d小时前", hours];
        }
    }
    else if (days == 1) {
        dateString = @"昨天";
    }
    else if (days == 2) {
        dateString = @"两天前";
    }
    else {
        dateString = [NSString stringWithFormat: @"%d天前", days];
    }
    
    return dateString;
}


-(NSInteger) minutesFromNow {
    return ([self timeIntervalSinceNow] / 60) * -1;
}

-(NSInteger) hoursFromNow {
    return ([self timeIntervalSinceNow] / (60 * 60)) * -1;
}

-(NSInteger) daysFromNow{
    return ([self timeIntervalSinceNow] / ((60 * 60) * 24)) * -1;
}

-(NSInteger) monthsForNow {
    return round([self daysFromNow] / 30.5) * -1;
}


@end
