//
//  HomeCollectionViewProxy.m
//  recreation
//
//  Created by mac on 2019/3/1.
//  Copyright © 2019年 WT. All rights reserved.
//

#import "HomeCollectionViewProxy.h"
#import "HomeCollectionViewCell.h"

//---------------------------1.7 创建类 遵守协议--------------------------
@interface  HomeCollectionViewProxy () <WTSegmentedControlDelegate>
@end
//---------------------------------end-------------------------------------

@implementation HomeCollectionViewProxy

//1.3版本-新增初始化方法
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier configuration:(WTCVConfigBlock)cBlock action:(WTCVActionBlock)aBlock {
    if (self = [super initWithReuseIdentifier:reuseIdentifier configuration:cBlock action:aBlock]) {
        // 注册方法. 子类重写父类的方法,传入cell注册标识reuseIdentifier
        [self.collectionView registerClass:HomeCollectionViewCell.class forCellWithReuseIdentifier:reuseIdentifier];
    }
    return self;
}

//---------------------------1.7版本-懒加载--------------------------
- (WTSegmentedControl *)segmentedControl {
    if (!_segmentedControl) {
        // 初始化化
        _segmentedControl = [[WTSegmentedControl alloc] initWithFrame:CGRectZero itemWidth:60 itemTitles:@[@"精选", @"热门", @"限时特惠"]];
        
        //---------------------------1.8 调整了颜色设置--------------------------
        // 设置颜色
        _segmentedControl.barTintColor = [UIColor colorWithHexString:@"0E121B"];
        _segmentedControl.tintColor = [UIColor colorWithHexString:@"FCCA07"];

        _segmentedControl.normalColor = [UIColor whiteColor];
        _segmentedControl.highlightColor = [UIColor colorWithHexString:@"FCCA07"];
        // 设置代理, 实现代理使collectionView连动
        _segmentedControl.delegate = self;
    }
    return _segmentedControl;
}

//---------------------------1.8版本-实现ScrollView代理方法--------------------------
#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat width = CGRectGetWidth(scrollView.frame);
    if (width > 0) {
        CGFloat index = scrollView.contentOffset.x / width;
        // 页面滚动,文字和黄色的线条会滚动.
        [_segmentedControl didMoveTo:index];
    }
}

// 实现代理点击cell的时候 collectionView会连动
- (void)segmentedControl:(WTSegmentedControl *)segmentedControl didSelectItemAtIndex:(NSInteger)selectedIndex fromIndex:(NSInteger)fromIndex {
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:selectedIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}
//---------------------------------end-------------------------------------

@end
