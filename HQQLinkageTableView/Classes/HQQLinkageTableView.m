//
//  HQQLinkageTableView.m
//  iosapp
//
//  Created by 黄强强 on 17/5/22.
//  Copyright © 2017年 黄强强. All rights reserved.
//

#import "HQQLinkageTableView.h"

#define HQQLinkageTableViewDefaultLeftWidth 120

@interface HQQLinkageTableView ()
@end

@implementation HQQLinkageTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    self.leftTableView = [self createTableView];
    self.rightTableView = [self createTableView];
    [self addSubview:self.leftTableView];
    [self addSubview:self.rightTableView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat leftTableViewWidth = self.leftTableViewWidth ? self.leftTableViewWidth : HQQLinkageTableViewDefaultLeftWidth;
    self.leftTableView.frame = CGRectMake(0, 0, leftTableViewWidth, self.frame.size.height);
    CGFloat offsetX = CGRectGetMaxX(self.leftTableView.frame);
    self.rightTableView.frame = CGRectMake(offsetX, 0, self.frame.size.width - offsetX, self.frame.size.height);
    
    self.rightTableView.contentInset = self.leftTableView.contentInset;
    self.rightTableView.scrollIndicatorInsets = self.rightTableView.contentInset;
}

- (UITableView *)createTableView
{
    UITableView *tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.showsVerticalScrollIndicator = YES;
    tableView.showsHorizontalScrollIndicator = NO;
    return tableView;
}

- (HQQLinkageTableViewCell *)dequeueReusableLeftCellWithIdentifier:(NSString *)identifier
{
    return [self.leftTableView dequeueReusableCellWithIdentifier:identifier];
}

- (HQQLinkageTableViewCell *)dequeueReusableRightCellWithIdentifier:(NSString *)identifier
{
    return [self.rightTableView dequeueReusableCellWithIdentifier:identifier];
}

- (void)reloadData
{
    [self.leftTableView reloadData];
    [self.rightTableView reloadData];
}

- (void)selectRowAtLeftTableViewIndex:(NSInteger)index
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    [self.leftTableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
    [self tableView:self.leftTableView didSelectRowAtIndexPath:indexPath];
}

- (void)selectRowAtRightTableViewIndex:(NSInteger)index
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    [self.rightTableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
}

#pragma mark - <UITableViewDelegate, UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.leftTableView) {
        return [self.dataSource numberOfRowsInLeftTableView:self];
    }
    else{
        NSIndexPath *leftIndexPath = [self.leftTableView indexPathForSelectedRow];
        return [self.dataSource numberOfRowsInRightTableView:self withLeftIndex:leftIndexPath.row];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.leftTableView) {
        return [self.dataSource leftTableView:self cellForRowAtIndex:indexPath.row];
    }
    else{
        NSIndexPath *leftIndexPath = [self.leftTableView indexPathForSelectedRow];
        return [self.dataSource rightTableView:self cellForRowAtLeftIndex:leftIndexPath.row rightIndex:indexPath.row];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.leftTableView) {
        if ([self.delegate respondsToSelector:@selector(leftTableView:heightForRowAtIndex:)]) {
            return [self.delegate leftTableView:self heightForRowAtIndex:indexPath.row];
        }
        return 44.0;
    }
    else{
        if ([self.delegate respondsToSelector:@selector(rightTableView:heightForRowAtLeftIndex:rightIndex:)]) {
            NSIndexPath *leftIndexPath = [self.leftTableView indexPathForSelectedRow];
            return [self.delegate rightTableView:self heightForRowAtLeftIndex:leftIndexPath.row rightIndex:indexPath.row];
        }
        return 44.0;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.leftTableView) {
        [self.rightTableView reloadData];
        // 滚动到最顶部
        [self.rightTableView setContentOffset:CGPointMake(0, -64) animated:YES];
//        [self.rightTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
    else{
        if ([self.delegate respondsToSelector:@selector(rightTableView:didSelectRowAtLeftIndex:rightIndex:)]) {
            NSIndexPath *leftIndexPath = [self.leftTableView indexPathForSelectedRow];
            [self.delegate rightTableView:self didSelectRowAtLeftIndex:leftIndexPath.row rightIndex:indexPath.row];
        }
    }
}

@end
