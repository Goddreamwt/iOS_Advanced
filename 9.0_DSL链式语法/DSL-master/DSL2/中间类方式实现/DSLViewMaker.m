//
//  DSLViewMaker.m
//  DSL
//
//  Created by sw on 2018/7/26.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "DSLViewMaker.h"
#define weak_Self __weak typeof(self) weakSelf = self
#define strong_Self __strong typeof((weakSelf)) strongSelf = (weakSelf)

@interface DSLViewMaker()
@property(nonatomic, strong) UIView *view;
@end

DSLViewMaker *alloc_view() {
    return [DSLViewMaker new];
}

@implementation DSLViewMaker

- (instancetype)init {
    if (self = [super init]) {
        _view = [UIView new];
    }
    
    return  self;
}

#pragma mark - Getter
- (DSLViewMaker *(^)(CGRect))frame {
    weak_Self;
    return ^DSLViewMaker *(CGRect frame) {
        strong_Self;
        strongSelf.view.frame = frame;
        return strongSelf;
    };
}

- (DSLViewMaker *(^)(UIColor *))backgroundColor {
    weak_Self;
    return ^DSLViewMaker *(UIColor *bgColor) {
        strong_Self;
        strongSelf.view.backgroundColor = bgColor;
        
        return strongSelf;
    };
}

- (DSLViewMaker *(^)(UIView *))addToSuperView {
    weak_Self;
    return ^DSLViewMaker *(UIView *superView) {
        strong_Self;
        [superView addSubview:strongSelf.view];
        return  strongSelf;
    };
}

- (id)instance {
    return _view;
}

@end
