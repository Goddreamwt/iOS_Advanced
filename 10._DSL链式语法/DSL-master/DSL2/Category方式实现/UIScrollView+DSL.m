//
//  UIScrollView+DSL.m
//  DSL2
//
//  Created by sw on 2018/7/29.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "UIScrollView+DSL.h"
#import "DSLHeader.h"


#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"
@implementation UIScrollView (DSL)
#pragma clang diagnostic pop

- (UIScrollView * (^)(CGPoint))DSL_contentOffset {
    weak_Self;
    return ^UIScrollView *(CGPoint  contentOffset) {
        strong_Self;
        strongSelf.contentOffset = contentOffset;
        return strongSelf;
    };
    
}
- (UIScrollView * (^)(CGSize))DSL_contentSize {
    weak_Self;
    return ^UIScrollView *(CGSize contentSize) {
        strong_Self;
        strongSelf.contentSize = contentSize;
        return strongSelf;
    };
}
- (UIScrollView * (^)(UIEdgeInsets))DSL_contentInset {
    weak_Self;
    return ^UIScrollView *(UIEdgeInsets contentInset) {
        strong_Self;
        strongSelf.contentInset = contentInset;
        return strongSelf;
    };
}
- (UIScrollView * (^)(UIScrollViewContentInsetAdjustmentBehavior))DSL_contentInsetAdjustmentBehavior {
    weak_Self;
    return ^UIScrollView *(UIScrollViewContentInsetAdjustmentBehavior contentInsetAdjustmentBehavior) {
        strong_Self;
        strongSelf.contentInsetAdjustmentBehavior = contentInsetAdjustmentBehavior;
        return strongSelf;
    };
}
- (UIScrollView * (^)(__weak id<UIScrollViewDelegate>))DSL_delegate {
    weak_Self;
    return ^UIScrollView *(__weak id<UIScrollViewDelegate> delegate) {
        strong_Self;
        strongSelf.delegate = delegate;
        return strongSelf;
    };
}
- (UIScrollView * (^)(BOOL))DSL_directionalLockEnabled {
    weak_Self;
    return ^UIScrollView *(BOOL directionalLockEnabled) {
        strong_Self;
        strongSelf.directionalLockEnabled = directionalLockEnabled;
        return strongSelf;
    };
}
- (UIScrollView * (^)(BOOL))DSL_bounces {
    weak_Self;
    return ^UIScrollView *(BOOL bounces) {
        strong_Self;
        strongSelf.bounces = bounces;
        return strongSelf;
    };
}
- (UIScrollView * (^)(BOOL))DSL_alwaysBounceVertical {
    weak_Self;
    return ^UIScrollView *(BOOL alwaysBounceVertical) {
        strong_Self;
        strongSelf.alwaysBounceVertical = alwaysBounceVertical;
        return strongSelf;
    };
}
- (UIScrollView * (^)(BOOL))DSL_alwaysBounceHorizontal {
    weak_Self;
    return ^UIScrollView *(BOOL alwaysBounceHorizontal) {
        strong_Self;
        strongSelf.alwaysBounceHorizontal = alwaysBounceHorizontal;
        return strongSelf;
    };
}
- (UIScrollView * (^)(BOOL))DSL_pagingEnabled {
    weak_Self;
    return ^UIScrollView *(BOOL pagingEnabled) {
        strong_Self;
        strongSelf.pagingEnabled = pagingEnabled;
        return strongSelf;
    };
}
- (UIScrollView * (^)(BOOL))DSL_scrollEnabled {
    weak_Self;
    return ^UIScrollView *(BOOL scrollEnabled) {
        strong_Self;
        strongSelf.scrollEnabled = scrollEnabled;
        return strongSelf;
    };
}
- (UIScrollView * (^)(BOOL))DSL_showsHorizontalScrollIndicator {
    weak_Self;
    return ^UIScrollView *(BOOL showsHorizontalscrollIndicator) {
        strong_Self;
        strongSelf.showsHorizontalScrollIndicator = showsHorizontalscrollIndicator;
        return strongSelf;
    };
}
- (UIScrollView * (^)(BOOL))DSL_showsVerticalScrollIndicator {
    weak_Self;
    return ^UIScrollView *(BOOL showsVerticalScrollIndicator) {
        strong_Self;
        strongSelf.showsVerticalScrollIndicator = showsVerticalScrollIndicator;
        return strongSelf;
    };
}
- (UIScrollView * (^)(UIEdgeInsets))DSL_scrollIndicatorInsets {
    weak_Self;
    return ^UIScrollView *(UIEdgeInsets scrollIndicatorInsets) {
        strong_Self;
        strongSelf.scrollIndicatorInsets = scrollIndicatorInsets;
        return strongSelf;
    };
}
- (UIScrollView * (^)(UIScrollViewIndicatorStyle))DSL_indicatorStyle {
    weak_Self;
    return ^UIScrollView *(UIScrollViewIndicatorStyle indicatorStyle) {
        strong_Self;
        strongSelf.indicatorStyle = indicatorStyle;
        return strongSelf;
    };
}
- (UIScrollView * (^)(CGFloat))DSL_decelerationRate {
    weak_Self;
    return ^UIScrollView *(CGFloat decelerationRate) {
        strong_Self;
        strongSelf.decelerationRate = decelerationRate;
        return strongSelf;
    };
}
- (UIScrollView * (^)(UIScrollViewIndexDisplayMode))DSL_indexDisplayMode {
    weak_Self;
    return ^UIScrollView *(UIScrollViewIndexDisplayMode indexDisplayMode) {
        strong_Self;
        strongSelf.indexDisplayMode = indexDisplayMode;
        return strongSelf;
    };
}
- (UIScrollView * (^)(BOOL))DSL_delaysContentTouches {
    weak_Self;
    return ^UIScrollView *(BOOL delaysContentTouches) {
        strong_Self;
        strongSelf.delaysContentTouches = delaysContentTouches;
        return strongSelf;
    };
}
- (UIScrollView * (^)(BOOL))DSL_canCancelContentTouches {
    weak_Self;
    return ^UIScrollView *(BOOL canCancelContentTouches) {
        strong_Self;
        strongSelf.canCancelContentTouches = canCancelContentTouches;
        return strongSelf;
    };
}
- (UIScrollView * (^)(CGFloat))DSL_minimumZoomScale {
    weak_Self;
    return ^UIScrollView *(CGFloat minimumZoomScale) {
        strong_Self;
        strongSelf.minimumZoomScale = minimumZoomScale;
        return strongSelf;
    };
}
- (UIScrollView * (^)(CGFloat))DSL_maximumZoomScale {
    weak_Self;
    return ^UIScrollView *(CGFloat maximumzoomscale) {
        strong_Self;
        strongSelf.maximumZoomScale = maximumzoomscale;
        return strongSelf;
    };
}
- (UIScrollView * (^)(CGFloat))DSL_zoomScale {
    weak_Self;
    return ^UIScrollView *(CGFloat zoomScale) {
        strong_Self;
        strongSelf.zoomScale = zoomScale;
        return strongSelf;
    };
}
- (UIScrollView * (^)(BOOL))DSL_bouncesZoom {
    weak_Self;
    return ^UIScrollView *(BOOL bouncesZoom) {
        strong_Self;
        strongSelf.bouncesZoom = bouncesZoom;
        return strongSelf;
    };
}
- (UIScrollView * (^)(BOOL))DSL_scrollsToTop {
    weak_Self;
    return ^UIScrollView *(BOOL scrollsToTop) {
        strong_Self;
        strongSelf.scrollsToTop = scrollsToTop;
        return strongSelf;
    };
}
- (UIScrollView * (^)(UIScrollViewKeyboardDismissMode))DSL_keyboardDismissMode {
    weak_Self;
    return ^UIScrollView *(UIScrollViewKeyboardDismissMode keyboardDismissMode) {
        strong_Self;
        strongSelf.keyboardDismissMode = keyboardDismissMode;
        return strongSelf;
    };
}
- (UIScrollView * (^)(UIRefreshControl *))DSL_refreshControl {
    weak_Self;
    return ^UIScrollView *(UIRefreshControl *refreshControl) {
        strong_Self;
        strongSelf.refreshControl = refreshControl;
        return strongSelf;
    };
}


@end
