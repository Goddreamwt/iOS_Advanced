//
//  HomeCollectionViewCell.h
//  recreation
//
//  Created by mac on 2019/3/1.
//  Copyright © 2019年 WT. All rights reserved.
//

#import "WTCollectionViewCell.h"
#import "HomeTableViewProxy.h"
#import "HomeTemplateResponse.h"

@interface HomeCollectionViewCell : WTCollectionViewCell

//1.3版本-新增属性
@property (nonatomic, strong) HomeTableViewProxy *tableViewProxy;

//----------------------1.9版本-数据传递的方法----------------------
// 配置HomeCollectionViewCell中 tableView的数据. 由HomeViewController传过来.
- (void)configWithResponse:(HomeTemplateResponse *)response;
//---------------------------end-------------------------------

@end
