//
//  WTSegmentedControl.h
//  recreation
//
//  Created by 王涛 on 2019/3/19.
//  Copyright © 2019年 WT. All rights reserved.
//

#import <UIKit/UIKit.h>

//----------------------1.7版本-新增分段控制的view----------------------
@class WTSegmentedControl;

//1.8 遵守的协议改成了UIToolbarDelegate----------------------
@protocol WTSegmentedControlDelegate <UIToolbarDelegate>
//---------------------------------end-------------------------------------

// 可以把分页控件,选中的页, 源头是从哪一页切过去的带出去处理.
- (void)segmentedControl:(WTSegmentedControl *)segmentedControl didSelectItemAtIndex:(NSInteger)selectedIndex fromIndex:(NSInteger)fromIndex;
@end


//1.8 继承改成了UIToolbar,便于顶部的系统导航栏实现一致的视觉效果----------------------
@interface WTSegmentedControl : UIToolbar

@property (nonatomic, weak) id<WTSegmentedControlDelegate> delegate;
// 当前所在页
@property (nonatomic, assign, readonly) NSInteger currentIndex;

// 文字颜色
@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *highlightColor;

// itemTitles 传数组.因为没DataSource,所以一开始就可以把数据传进来.
- (instancetype)initWithFrame:(CGRect)frame itemWidth:(CGFloat)itemWidth itemTitles:(NSArray *)itemTitles;
//----------------------1.8版本-新增方法----------------------
// 提供给collectionView移动跟着联动的方法
- (void)didMoveTo:(CGFloat)index;

@end

