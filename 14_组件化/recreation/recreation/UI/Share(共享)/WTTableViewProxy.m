//
//  WTTableViewProxy.m
//  recreation
//
//  Created by mac on 2019/3/1.
//  Copyright © 2019年 WT. All rights reserved.
//

#import "WTTableViewProxy.h"

//-----1.3版本-添加tableView-----
@interface WTTableViewProxy () <UITableViewDelegate, UITableViewDataSource>
@end

@implementation WTTableViewProxy

// 初始化方法
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
                          configuration:(WTTVConfigBlock)cBlock
                                 action:(WTTVActionBlock)aBlock {
    if (self = [super init]) {
        _reuseIdentifier = reuseIdentifier; // 传进来的cell标识符
        _cellConfigBlock = cBlock;
        _cellActionBlock = aBlock;
    }
    return self;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 200) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
#warning todo cell有多种复用标识符.在这用for循环记录复用cell的className 类名在这进行注册
        //        for (NSString *className in collection) {
        //            [_tableView registerClass:<#(nullable Class)#> forCellReuseIdentifier:<#(nonnull NSString *)#>]
        //        }
    }
    return _tableView;
}

#pragma mark TableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 10;
}

// 点击有响应事件之后,回调到外面进行处理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_cellActionBlock) {
        _cellActionBlock([_tableView cellForRowAtIndexPath:indexPath], _dataArray[indexPath.row], indexPath);
    }
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_reuseIdentifier forIndexPath:indexPath];
    if (_cellConfigBlock) {
        _cellConfigBlock(cell, _dataArray[indexPath.row], indexPath);
    }
    return cell;
}

@end
