//
//  RCFirstViewController.m
//  ruby-china-for-ios
//
//  Created by Jason Lee on 12-12-10.
//  Copyright (c) 2012年 Ruby China. All rights reserved.
//

#import "RCTopicsViewController.h"
#import "RCTopicCell.h"
#import "RCAll.h"

@interface RCTopicsViewController ()

@end

@implementation RCTopicsViewController

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        //
        topics = [[NSArray alloc] init];
    }
    return self;
}

- (void)dealloc {
    [topics release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self refresh];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 基础方法
- (void) refresh {
    [RCTopic remoteAllAsync:^(NSArray *allRemote, NSError *error) {
        [topics release];
        topics = [allRemote retain];
        [tableView reloadData];
    }];
}

#pragma mark - TableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [topics count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RCTopic *topic = [topics objectAtIndex:indexPath.row];
    NSLog(@"row: %d",indexPath.row);
    RCTopicCell *cell = [[RCTopicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = topic.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",topic.createdAt];
    return cell;
}
@end
