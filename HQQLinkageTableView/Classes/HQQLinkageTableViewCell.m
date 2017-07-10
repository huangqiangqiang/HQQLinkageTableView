//
//  HQQLinkageTableViewCell.m
//  iosapp
//
//  Created by 黄强强 on 17/5/22.
//  Copyright © 2017年 黄强强. All rights reserved.
//

#import "HQQLinkageTableViewCell.h"
#import "HQQLinkageTableView.h"

@interface HQQLinkageTableViewCell()

@end

@implementation HQQLinkageTableViewCell

+ (instancetype)leftCellWithTableView:(HQQLinkageTableView *)tableView
{
    static NSString *ID = @"HQQLinkageTableViewLeftCellID";
    id cell = [tableView dequeueReusableLeftCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    return cell;
}

+ (instancetype)rightCellWithTableView:(HQQLinkageTableView *)tableView
{
    static NSString *ID = @"HQQLinkageTableViewRightCellID";
    id cell = [tableView dequeueReusableRightCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

@end
