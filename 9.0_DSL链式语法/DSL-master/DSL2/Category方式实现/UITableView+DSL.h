//
//  UITableView+DSL.h
//  DSL2
//
//  Created by sw on 2018/7/30.
//  Copyright © 2018年 ws. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (DSL)
#pragma mark - UIView
- (UITableView* (^)(CGRect))DSL_frame;
- (UITableView* (^)(UIColor *))DSL_backgroundColor;

#pragma mark - UIScrollView
- (UITableView * (^)(CGPoint))DSL_contentOffset;
- (UITableView * (^)(CGSize))DSL_contentSize;
- (UITableView * (^)(UIEdgeInsets))DSL_contentInset;
- (UITableView * (^)(UIScrollViewContentInsetAdjustmentBehavior))DSL_contentInsetAdjustmentBehavior;
- (UITableView * (^)(__weak id<UIScrollViewDelegate>))DSL_delegate;
- (UITableView * (^)(BOOL))DSL_directionalLockEnabled;
- (UITableView * (^)(BOOL))DSL_bounces;
- (UITableView * (^)(BOOL))DSL_alwaysBounceVertical;
- (UITableView * (^)(BOOL))DSL_alwaysBounceHorizontal;
- (UITableView * (^)(BOOL))DSL_pagingEnabled;
- (UITableView * (^)(BOOL))DSL_scrollEnabled;
- (UITableView * (^)(BOOL))DSL_showsHorizontalScrollIndicator;
- (UITableView * (^)(BOOL))DSL_showsVerticalScrollIndicator;
- (UITableView * (^)(UIEdgeInsets))DSL_scrollIndicatorInsets;
- (UITableView * (^)(UIScrollViewIndicatorStyle))DSL_indicatorStyle;
- (UITableView * (^)(CGFloat))DSL_decelerationRate;
- (UITableView * (^)(UIScrollViewIndexDisplayMode))DSL_indexDisplayMode;
- (UITableView * (^)(BOOL))DSL_delaysContentTouches;
- (UITableView * (^)(BOOL))DSL_canCancelContentTouches;
- (UITableView * (^)(CGFloat))DSL_minimumZoomScale;
- (UITableView * (^)(CGFloat))DSL_maximumZoomScale;
- (UITableView * (^)(CGFloat))DSL_zoomScale;
- (UITableView * (^)(BOOL))DSL_bouncesZoom;
- (UITableView * (^)(BOOL))DSL_scrollsToTop;
- (UITableView * (^)(UIScrollViewKeyboardDismissMode))DSL_keyboardDismissMode;
- (UITableView * (^)(UIRefreshControl *))DSL_refreshControl;




@end
