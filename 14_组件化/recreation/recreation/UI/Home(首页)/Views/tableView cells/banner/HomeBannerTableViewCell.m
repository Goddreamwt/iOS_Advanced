//
//  HomeBannerTableViewCell.m
//  TZVideoDemo
//
//  Created by Dream on 2018/7/26.
//  Copyright © 2018年 TZ. All rights reserved.
//

#import "HomeBannerTableViewCell.h"
#import "HomeBannerCollectionViewCell.h"
#import "HomeTemplateResponse.h"

//----------------------1.9版本-实现图片轮播器代理方法----------------------
// 要使用图片轮播器框架TYCyclePagerView  就需要实现它的代理方法和数据源源
@interface HomeBannerTableViewCell () <TYCyclePagerViewDelegate,TYCyclePagerViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArray; /**< 数据数组 */

@end
//----------------------------end------------------------------


//-------------------1.4版本-添加子类cell继承基类,做图片轮播器的-------------------
@implementation HomeBannerTableViewCell

//----------------------1.9版本-实现图片轮播器----------------------
- (void)awakeFromNib {
    [super awakeFromNib];
    
    // 注册CollectionViewCell的类名转字符串
    NSString *cellName = NSStringFromClass([HomeBannerCollectionViewCell class]);
    [self.cycleView registerNib:[UINib nibWithNibName:cellName bundle:nil] forCellWithReuseIdentifier:cellName];
    // 滚动间距
    self.cycleView.autoScrollInterval = 5;
    self.cycleView.delegate = self;
    self.cycleView.dataSource = self;
}

// 配置数据的方法,父类里面写了抽象方法.子类实现,供HomeCollectionViewCell调用
- (void)configWithData:(id)data {
    if ([data isKindOfClass:[HomeTemplateItem class]]) {
        self.dataArray = [NSMutableArray arrayWithArray:[(HomeTemplateItem *)data templateData]];
        [self.cycleView reloadData];
    }
}

#pragma mark - TYCyclePagerViewDataSource
- (NSInteger)numberOfItemsInPagerView:(TYCyclePagerView *)pageView {
    return self.dataArray.count;
}

- (UICollectionViewCell *)pagerView:(TYCyclePagerView *)pagerView cellForItemAtIndex:(NSInteger)index {
    if (index >= self.dataArray.count) {
        return [UICollectionViewCell new];
    }
    id data = self.dataArray[index];

    // 获取cell
    HomeBannerCollectionViewCell *cell = [pagerView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HomeBannerCollectionViewCell class]) forIndex:index];
    
    // 数据传给 HomeBannerCollectionViewCell. 显示新的轮播图
    [cell configWithData:data];
    return cell;
}

// collectionView的layout布局页面
- (TYCyclePagerViewLayout *)layoutForPagerView:(TYCyclePagerView *)pageView {
    CGFloat space = 0;
    CGSize itemSize = CGSizeMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    TYCyclePagerViewLayout *layout = [[TYCyclePagerViewLayout alloc]init];
    layout.itemSize = itemSize;
    layout.itemSpacing = space;
    return layout;
}

#pragma mark - TYCyclePagerViewDelegate
// 滚动到的索引位置,每次切换的图片的时候都会调
- (void)pagerView:(TYCyclePagerView *)pageView didScrollFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    //    NSLog(@"----");
}

// 点击轮播器的cell会执行的方法
- (void)pagerView:(TYCyclePagerView *)pageView didSelectedItemCell:(__kindof UICollectionViewCell *)cell atIndex:(NSInteger)index {
    if (index >= self.dataArray.count)   return;
    id data = self.dataArray[index];
    //    NSLog(@"--data = %@--",data);
}
//----------------------------end------------------------------

@end
//----------------------------end------------------------------
