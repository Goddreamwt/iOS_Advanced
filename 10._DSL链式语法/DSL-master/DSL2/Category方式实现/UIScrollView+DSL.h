//
//  UIScrollView+DSL.h
//  DSL2
//
//  Created by sw on 2018/7/29.
//  Copyright © 2018年 ws. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (DSL)
#pragma mark - UIView
- (UIScrollView* (^)(CGRect))DSL_frame;
- (UIScrollView* (^)(UIColor *))DSL_backgroundColor;

#pragma mark - UIScrollView
- (UIScrollView * (^)(CGPoint))DSL_contentOffset;
- (UIScrollView * (^)(CGSize))DSL_contentSize;
- (UIScrollView * (^)(UIEdgeInsets))DSL_contentInset;
- (UIScrollView * (^)(UIScrollViewContentInsetAdjustmentBehavior))DSL_contentInsetAdjustmentBehavior;
- (UIScrollView * (^)(__weak id<UIScrollViewDelegate>))DSL_delegate;
- (UIScrollView * (^)(BOOL))DSL_directionalLockEnabled;
- (UIScrollView * (^)(BOOL))DSL_bounces;
- (UIScrollView * (^)(BOOL))DSL_alwaysBounceVertical;
- (UIScrollView * (^)(BOOL))DSL_alwaysBounceHorizontal;
- (UIScrollView * (^)(BOOL))DSL_pagingEnabled;
- (UIScrollView * (^)(BOOL))DSL_scrollEnabled;
- (UIScrollView * (^)(BOOL))DSL_showsHorizontalScrollIndicator;
- (UIScrollView * (^)(BOOL))DSL_showsVerticalScrollIndicator;
- (UIScrollView * (^)(UIEdgeInsets))DSL_scrollIndicatorInsets;
- (UIScrollView * (^)(UIScrollViewIndicatorStyle))DSL_indicatorStyle;
- (UIScrollView * (^)(CGFloat))DSL_decelerationRate;
- (UIScrollView * (^)(UIScrollViewIndexDisplayMode))DSL_indexDisplayMode;
- (UIScrollView * (^)(BOOL))DSL_delaysContentTouches;
- (UIScrollView * (^)(BOOL))DSL_canCancelContentTouches;
- (UIScrollView * (^)(CGFloat))DSL_minimumZoomScale;
- (UIScrollView * (^)(CGFloat))DSL_maximumZoomScale;
- (UIScrollView * (^)(CGFloat))DSL_zoomScale;
- (UIScrollView * (^)(BOOL))DSL_bouncesZoom;
- (UIScrollView * (^)(BOOL))DSL_scrollsToTop;
- (UIScrollView * (^)(UIScrollViewKeyboardDismissMode))DSL_keyboardDismissMode;
- (UIScrollView * (^)(UIRefreshControl *))DSL_refreshControl;







@end
