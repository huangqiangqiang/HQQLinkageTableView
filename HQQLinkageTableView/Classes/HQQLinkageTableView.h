//
//  HQQLinkageTableView.h
//  iosapp
//
//  Created by 黄强强 on 17/5/22.
//  Copyright © 2017年 黄强强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HQQLinkageTableViewCell.h"

@protocol HQQLinkageTableViewDelegate <NSObject>

@optional
- (void)rightTableView:(HQQLinkageTableView *)tableView didSelectRowAtLeftIndex:(NSInteger)leftIndex rightIndex:(NSInteger)rightIndex;

- (CGFloat)leftTableView:(HQQLinkageTableView *)tableView heightForRowAtIndex:(NSInteger)index;
- (CGFloat)rightTableView:(HQQLinkageTableView *)tableView heightForRowAtLeftIndex:(NSInteger)leftIndex rightIndex:(NSInteger)rightIndex;

@end

@protocol HQQLinkageTableViewDataSource <NSObject>

@required
- (NSInteger)numberOfRowsInLeftTableView:(HQQLinkageTableView *)tableView;
- (HQQLinkageTableViewCell *)leftTableView:(HQQLinkageTableView *)tableView cellForRowAtIndex:(NSInteger)index;

- (NSInteger)numberOfRowsInRightTableView:(HQQLinkageTableView *)tableView withLeftIndex:(NSInteger)leftIndex;
- (HQQLinkageTableViewCell *)rightTableView:(HQQLinkageTableView *)tableView cellForRowAtLeftIndex:(NSInteger)leftIndex rightIndex:(NSInteger)rightIndex;


@end

@interface HQQLinkageTableView : UIView <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) id<HQQLinkageTableViewDelegate> delegate;
@property (nonatomic, weak) id<HQQLinkageTableViewDataSource> dataSource;

@property (nonatomic, assign) CGFloat leftTableViewWidth;

@property (nonatomic, strong) UITableView *leftTableView;
@property (nonatomic, strong) UITableView *rightTableView;

- (HQQLinkageTableViewCell *)dequeueReusableLeftCellWithIdentifier:(NSString *)identifier;
- (HQQLinkageTableViewCell *)dequeueReusableRightCellWithIdentifier:(NSString *)identifier;

- (void)reloadData;

- (void)selectRowAtLeftTableViewIndex:(NSInteger)index;
- (void)selectRowAtRightTableViewIndex:(NSInteger)index;

@end
