//
//  RCTopicCell.m
//  ruby-china-for-ios
//
//  Created by Jason Lee on 12-12-10.
//  Copyright (c) 2012年 Ruby China. All rights reserved.
//

#import "RCTopicTableViewCell.h"
#import "RCTopic.h"
#import "RCUser.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <MHPrettyDate.h>

@implementation RCTopicTableViewCell

- (id) initWithTopic: (RCTopic *) aTopic {
    return [self initWithTopic:aTopic forDetail:NO];
}

- (id) initWithTopic: (RCTopic *) aTopic forDetail:(BOOL)isForDetail {
    self = [super initWithStyle:UITableViewCellSelectionStyleGray reuseIdentifier:[NSString stringWithFormat:@"topic-%d", [aTopic.remoteID intValue]]];
    
    topic = aTopic;
    
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 32, 32)];
        [avatarImageView setImageWithURL:[NSURL URLWithString:topic.user.avatarUrl] placeholderImage:[RCUser defaultAvatarImage]];
        [self addSubview:avatarImageView];
        
        
        int titleWidth = self.frame.size.width - avatarImageView.frame.size.width - 30;
        CGSize titleSize = [topic.title sizeWithFont:[UIFont systemFontOfSize:14]
                                   constrainedToSize:CGSizeMake(titleWidth, MAXFLOAT)
                                       lineBreakMode:NSLineBreakByWordWrapping];
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(avatarImageView.frame.size.width + avatarImageView.frame.origin.x + 10, avatarImageView.frame.origin.y - 2, titleWidth, MAX(18, MIN(36, titleSize.height)))];
        [titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
        titleLabel.textAlignment = NSTextAlignmentLeft;
        titleLabel.numberOfLines = 3;
        [titleLabel setText:topic.title];
        [titleLabel setFont:[UIFont systemFontOfSize:14]];
        [self.contentView addSubview:titleLabel];
        
        
        // Info
        NSString *info = [NSString stringWithFormat:@" %@ • %@ ",topic.nodeName,topic.user.login];
        
        infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleLabel.frame.origin.x - 3, titleLabel.frame.size.height + titleLabel.frame.origin.y + 5, self.frame.size.width - 150, 14)];
        [infoLabel setText:info];
        [infoLabel setFont:[UIFont systemFontOfSize:12]];
        [infoLabel setTextColor:[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0000]];
        [self addSubview:infoLabel];
        
        counterLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - 100, infoLabel.frame.origin.y, 90, 14)];
        [counterLabel setText:[NSString stringWithFormat:@"%d回复",[topic.repliesCount intValue]]];
        [counterLabel setFont:[UIFont systemFontOfSize:12]];
        [counterLabel setTextAlignment:NSTextAlignmentRight];
        [counterLabel setTextColor:[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0000]];
        [self addSubview:counterLabel];
        
        if (isForDetail) {
            bodyLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleLabel.frame.origin.x, infoLabel.frame.origin.y + 20, titleWidth, 14)];
            [bodyLabel setText:topic.bodyHtml];
            bodyLabel.font = [UIFont systemFontOfSize:13];
            bodyLabel.numberOfLines = 10;
            [bodyLabel setLineBreakMode:NSLineBreakByWordWrapping];
            bodyLabel.textAlignment = NSTextAlignmentLeft;
            [self addSubview:bodyLabel];
        }
        
    }
    return self;
}

@end
