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
    }
    return self;
}

//创建Cell
- (HomeTableViewProxy *)tableViewProxy {
    if (!_tableViewProxy) {
        _tableViewProxy = [[HomeTableViewProxy alloc] initWithReuseIdentifier:@"HomeTableViewCell" configuration:^(UITableViewCell *cell, id cellData, NSIndexPath *indexPath) {
            //代码
        } action:^(UITableViewCell *cell, id cellData, NSIndexPath *indexPath) {
            // 会有tableView的点击事件要处理.
        }];
    }
    return _tableViewProxy;
}
@end
