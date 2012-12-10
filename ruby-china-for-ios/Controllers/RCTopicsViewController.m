//
//  RCFirstViewController.m
//  ruby-china-for-ios
//
//  Created by Jason Lee on 12-12-10.
//  Copyright (c) 2012年 Ruby China. All rights reserved.
//

#import "RCTopicsViewController.h"
#import "RCTopicViewController.h"
#import "RCTopicTableViewCell.h"
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"reload_icon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(refresh)];
    self.navigationController.navigationBar.topItem.title = @"社区";
    self.navigationController.navigationBar.topItem.leftBarButtonItem = refreshButton;
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
        topics = allRemote;
        [tableView reloadData];
    }];
}

#pragma mark - TableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [topics count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    int titleWidth = self.view.frame.size.width - 32 - 40;
    RCTopic *topic = [topics objectAtIndex:indexPath.row];
    NSString *titleString = topic.title;
	NSString *detailString = topic.nodeName;
	CGSize titleSize = [titleString sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(titleWidth, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
	CGSize detailSize = [detailString sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:CGSizeMake(titleWidth, MAXFLOAT) lineBreakMode:NSLineBreakByTruncatingTail];
    
	return MAX(50, detailSize.height + 20 + titleSize.height);
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RCTopic *topic = [topics objectAtIndex:indexPath.row];
    RCTopicTableViewCell *cell = [[RCTopicTableViewCell alloc] initWithTopic:topic];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RCTopic *topic = [topics objectAtIndex:indexPath.row];
    
    [[RCTopicViewController sharedInstance] setTopic:topic];
    [self.navigationController pushViewController:[RCTopicViewController sharedInstance] animated:YES];
    
}
@end
