//
//  HQQLinkageTableViewCell.h
//  iosapp
//
//  Created by 黄强强 on 17/5/22.
//  Copyright © 2017年 黄强强. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HQQLinkageTableView;

@interface HQQLinkageTableViewCell : UITableViewCell

+ (instancetype)leftCellWithTableView:(HQQLinkageTableView *)tableView;
+ (instancetype)rightCellWithTableView:(HQQLinkageTableView *)tableView;

@end
