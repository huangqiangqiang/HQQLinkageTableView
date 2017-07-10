//
//  HQQLinkageTableViewController.h
//  iosapp
//
//  Created by 黄强强 on 17/5/22.
//  Copyright © 2017年 黄强强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HQQLinkageTableView.h"


@interface HQQLinkageTableViewController : UIViewController <HQQLinkageTableViewDelegate, HQQLinkageTableViewDataSource>

@property (nonatomic, strong) HQQLinkageTableView *tableView;
- (void)reloadData;

@end
