//
//  HomeCollectionViewCell.h
//  recreation
//
//  Created by mac on 2019/3/1.
//  Copyright © 2019年 WT. All rights reserved.
//

#import "WTCollectionViewCell.h"
#import "HomeTableViewProxy.h"

@interface HomeCollectionViewCell : WTCollectionViewCell

//1.3版本-新增属性
@property (nonatomic, strong) HomeTableViewProxy *tableViewProxy;

@end
