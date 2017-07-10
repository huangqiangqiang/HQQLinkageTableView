//
//  HQQLinkageTableViewController.m
//  iosapp
//
//  Created by 黄强强 on 17/5/22.
//  Copyright © 2017年 黄强强. All rights reserved.
//

#import "HQQLinkageTableViewController.h"


@implementation HQQLinkageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[HQQLinkageTableView alloc] init];
    self.tableView.leftTableViewWidth = self.view.frame.size.width * 0.3;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

#pragma mark - <HQQLinkageTableViewDelegate, HQQLinkageTableViewDataSource>

// override

@end
