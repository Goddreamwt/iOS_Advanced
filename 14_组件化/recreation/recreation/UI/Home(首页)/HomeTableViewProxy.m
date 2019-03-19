//
//  HomeTableViewProxy.m
//  recreation
//
//  Created by mac on 2019/3/1.
//  Copyright © 2019年 WT. All rights reserved.
//

#import "HomeTableViewProxy.h"
#import "HomeTableViewDefines.h"

@interface HomeTableViewProxy() <UITabBarDelegate,UITableViewDataSource>
@end

@implementation HomeTableViewProxy

//----------------------1.4版本-新增 初始化方法,实现协议的代理和数据源方法-------------------------
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier configuration:(WTTVConfigBlock)cBlock action:(WTTVActionBlock)aBlock {
    if (self = [super initWithReuseIdentifier:reuseIdentifier configuration:cBlock action:aBlock]) {
        
        // 复用标识符,使用的都是类名.
        for (NSString *className in HomeTableViewCellIdentifiers.allValues) {
            [self.tableView registerClass:NSClassFromString(className) forCellReuseIdentifier:className];
        }
    }
    return self;
}

#pragma mark tableview delegate
// 这个key就是后台下发的数据源里面的.  子类里面跟父类实现不一样. 所以重写一遍
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 这个cellModuleName是后台数据带回给我们的. 这里暂时假设返回的是banner
    NSString *cellModuleName = self.dataArray[indexPath.row];
    return [[HomeTableViewCellHeights objectForKey:cellModuleName] floatValue];
}

// 点击有响应事件之后,回调到外面进行处理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.cellActionBlock) {
        self.cellActionBlock([tableView cellForRowAtIndexPath:indexPath], self.dataArray[indexPath.row], indexPath);
    }
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 用到的cell是下发过来创建好的.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[HomeTableViewCellIdentifiers objectForKey:self.dataArray[indexPath.row]] forIndexPath:indexPath];
    if (self.cellConfigBlock) {
        self.cellConfigBlock(cell, self.dataArray[indexPath.row], indexPath);
    }
    return cell;
}
@end
