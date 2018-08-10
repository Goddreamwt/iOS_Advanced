//
//  UICollectionView+DSL.h
//  DSL2
//
//  Created by sw on 2018/7/30.
//  Copyright © 2018年 ws. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (DSL)
#pragma mark - UIView
- (UICollectionView* (^)(CGRect))DSL_frame;
- (UICollectionView* (^)(UIColor *))DSL_backgroundColor;

#pragma mark - UIScrollView
- (UICollectionView * (^)(CGPoint))DSL_contentOffset;
- (UICollectionView * (^)(CGSize))DSL_contentSize;
- (UICollectionView * (^)(UIEdgeInsets))DSL_contentInset;
- (UICollectionView * (^)(UIScrollViewContentInsetAdjustmentBehavior))DSL_contentInsetAdjustmentBehavior;
//- (UICollectionView * (^)(__weak id<UIScrollViewDelegate>))DSL_delegate;
- (UICollectionView * (^)(BOOL))DSL_directionalLockEnabled;
- (UICollectionView * (^)(BOOL))DSL_bounces;
- (UICollectionView * (^)(BOOL))DSL_alwaysBounceVertical;
- (UICollectionView * (^)(BOOL))DSL_alwaysBounceHorizontal;
- (UICollectionView * (^)(BOOL))DSL_pagingEnabled;
- (UICollectionView * (^)(BOOL))DSL_scrollEnabled;
- (UICollectionView * (^)(BOOL))DSL_showsHorizontalScrollIndicator;
- (UICollectionView * (^)(BOOL))DSL_showsVerticalScrollIndicator;
- (UICollectionView * (^)(UIEdgeInsets))DSL_scrollIndicatorInsets;
- (UICollectionView * (^)(UIScrollViewIndicatorStyle))DSL_indicatorStyle;
- (UICollectionView * (^)(CGFloat))DSL_decelerationRate;
- (UICollectionView * (^)(UIScrollViewIndexDisplayMode))DSL_indexDisplayMode;
- (UICollectionView * (^)(BOOL))DSL_delaysContentTouches;
- (UICollectionView * (^)(BOOL))DSL_canCancelContentTouches;
- (UICollectionView * (^)(CGFloat))DSL_minimumZoomScale;
- (UICollectionView * (^)(CGFloat))DSL_maximumZoomScale;
- (UICollectionView * (^)(CGFloat))DSL_zoomScale;
- (UICollectionView * (^)(BOOL))DSL_bouncesZoom;
- (UICollectionView * (^)(BOOL))DSL_scrollsToTop;
- (UICollectionView * (^)(UIScrollViewKeyboardDismissMode))DSL_keyboardDismissMode;
- (UICollectionView * (^)(UIRefreshControl *))DSL_refreshControl;

#pragma mark - UICollectionView
- (UICollectionView * (^)(UICollectionViewFlowLayout *))DSL_collectionViewLayout;
- (UICollectionView * (^)(__weak id<UICollectionViewDelegate>))DSL_delegate;
- (UICollectionView * (^)(id<UICollectionViewDataSource>))DSL_dataSource;
- (UICollectionView * (^)(__weak id<UICollectionViewDataSourcePrefetching>))DSL_prefetchDataSource;
- (UICollectionView *(^)(BOOL))DSL_prefetchingEnabled;
- (UICollectionView *(^)(__weak id<UICollectionViewDragDelegate>))DSL_dragDelegate;
- (UICollectionView *(^)(__weak id<UICollectionViewDropDelegate>))DSL_dropDelegate;
- (UICollectionView *(^)(BOOL))DSL_dragInteractionEnabled;
- (UICollectionView *(^)(UICollectionViewReorderingCadence))DSL_reorderingCadence;
- (UICollectionView *(^)(UIView *))DSL_backgroundView;
- (UICollectionView *(^)(BOOL))DSL_allowsSelection;
- (UICollectionView *(^)(BOOL))DSL_allowsMultipleSelection;
- (UICollectionView *(^)(BOOL))DSL_remembersLastFocusedIndexPath;




@end
