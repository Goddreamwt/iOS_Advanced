//
//  HomeCollectionViewCell.m
//  recreation
//
//  Created by mac on 2019/3/1.
//  Copyright © 2019年 WT. All rights reserved.
//

#import "HomeCollectionViewCell.h"

@implementation HomeCollectionViewCell

//1.3版本-新增功能
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.tableViewProxy.tableView];
        //----------------------1.5用Masonry进行自动布局-------------------
        // 设置tableView的约束
        [_tableViewProxy.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }
    return self;
}

//创建Cell
- (HomeTableViewProxy *)tableViewProxy {
    if (!_tableViewProxy) {
        _tableViewProxy = [[HomeTableViewProxy alloc] initWithReuseIdentifier:@"HomeTableViewCell" configuration:^(UITableViewCell *cell, id cellData, NSIndexPath *indexPath) {
            cell.textLabel.text = (NSString *)cellData;
        } action:^(UITableViewCell *cell, id cellData, NSIndexPath *indexPath) {
            [[[UIAlertView alloc] initWithTitle:@"table view cell" message:(NSString *)cellData delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        }];
        // 这个数据本应该从服务器取,这里用来模拟那边下发过来的.
        _tableViewProxy.dataArray = @[@"banner", @"title", @"banner", @"banner", @"title"];
    }
    return _tableViewProxy;
}
@end
