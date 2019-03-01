//
//  HomeCollectionViewProxy.m
//  recreation
//
//  Created by mac on 2019/3/1.
//  Copyright © 2019年 WT. All rights reserved.
//

#import "HomeCollectionViewProxy.h"
#import "HomeCollectionViewCell.h"

@implementation HomeCollectionViewProxy

//1.3版本-新增初始化方法
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier configuration:(WTCVConfigBlock)cBlock action:(WTCVActionBlock)aBlock {
    if (self = [super initWithReuseIdentifier:reuseIdentifier configuration:cBlock action:aBlock]) {
        // 注册方法. 子类重写父类的方法,传入cell注册标识reuseIdentifier
        [self.collectionView registerClass:HomeCollectionViewCell.class forCellWithReuseIdentifier:reuseIdentifier];
    }
    return self;
}
@end
