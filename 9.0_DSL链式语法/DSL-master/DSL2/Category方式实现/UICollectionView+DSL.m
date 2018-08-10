//
//  UICollectionView+DSL.m
//  DSL2
//
//  Created by sw on 2018/7/30.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "UICollectionView+DSL.h"
#import "DSLHeader.h"


#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"
@implementation UICollectionView (DSL)
#pragma clang diagnostic pop

- (UICollectionView * (^)(UICollectionViewFlowLayout *))DSL_collectionViewLayout {
    weak_Self;
    return ^UICollectionView *(UICollectionViewFlowLayout *collectionViewLayout) {
        strong_Self;
        strongSelf.collectionViewLayout = collectionViewLayout;
        return strongSelf;
    };
}
- (UICollectionView * (^)(__weak id<UICollectionViewDelegate>))DSL_delegate {
    weak_Self;
    return ^UICollectionView *(__weak id<UICollectionViewDelegate> delegate) {
        strong_Self;
        strongSelf.delegate = delegate;
        return strongSelf;
    };
}
- (UICollectionView * (^)(id<UICollectionViewDataSource>))DSL_dataSource {
    weak_Self;
    return ^UICollectionView *(__weak id<UICollectionViewDataSource> dataSource) {
        strong_Self;
        strongSelf.dataSource = dataSource;
        return strongSelf;
    };
}
- (UICollectionView * (^)(__weak id<UICollectionViewDataSourcePrefetching>))DSL_prefetchDataSource {
    weak_Self;
    return ^UICollectionView *(id<UICollectionViewDataSourcePrefetching> prefetchDataSource) {
        strong_Self;
        strongSelf.prefetchDataSource = prefetchDataSource;
        return strongSelf;
    };
}
- (UICollectionView *(^)(BOOL))DSL_prefetchingEnabled {
    weak_Self;
    return ^UICollectionView *(BOOL prefetchingEnabled) {
        strong_Self;
        strongSelf.prefetchingEnabled = prefetchingEnabled;
        return strongSelf;
    };
}
- (UICollectionView *(^)(__weak id<UICollectionViewDragDelegate>))DSL_dragDelegate {
    weak_Self;
    return ^UICollectionView *(__weak id<UICollectionViewDragDelegate> dragDelegate) {
        strong_Self;
        strongSelf.dragDelegate = dragDelegate;
        return strongSelf;
    };
}
- (UICollectionView *(^)(__weak id<UICollectionViewDropDelegate>))DSL_dropDelegate {
    weak_Self;
    return ^UICollectionView *(__weak id<UICollectionViewDropDelegate> dropDelegate) {
        strong_Self;
        strongSelf.dropDelegate = dropDelegate;
        return strongSelf;
    };
}
- (UICollectionView *(^)(BOOL))DSL_dragInteractionEnabled {
    weak_Self;
    return ^UICollectionView *(BOOL dragInteractionEnabled) {
        strong_Self;
        strongSelf.dragInteractionEnabled = dragInteractionEnabled;
        return strongSelf;
    };
}
- (UICollectionView *(^)(UICollectionViewReorderingCadence))DSL_reorderingCadence {
    weak_Self;
    return ^UICollectionView *(UICollectionViewReorderingCadence reorderingCadence) {
        strong_Self;
        strongSelf.reorderingCadence = reorderingCadence;
        return strongSelf;
    };
}
- (UICollectionView *(^)(UIView *))DSL_backgroundView {
    weak_Self;
    return ^UICollectionView *(UIView *backgroundView) {
        strong_Self;
        strongSelf.backgroundView = backgroundView;
        return strongSelf;
    };
}
- (UICollectionView *(^)(BOOL))DSL_allowsSelection {
    weak_Self;
    return ^UICollectionView *(BOOL allowsSelection) {
        strong_Self;
        strongSelf.allowsSelection = allowsSelection;
        return strongSelf;
    };
}
- (UICollectionView *(^)(BOOL))DSL_allowsMultipleSelection {
    weak_Self;
    return ^UICollectionView *(BOOL allowsMultipleSelection) {
        strong_Self;
        strongSelf.allowsMultipleSelection = allowsMultipleSelection;
        return strongSelf;
    };
}
- (UICollectionView *(^)(BOOL))DSL_remembersLastFocusedIndexPath {
    weak_Self;
    return ^UICollectionView *(BOOL remembersLastFocusedIndexPath) {
        strong_Self;
        strongSelf.remembersLastFocusedIndexPath = remembersLastFocusedIndexPath;
        return strongSelf;
    };
}

@end
