//
//  UIButton+DSL.m
//  DSL2
//
//  Created by sw on 2018/7/28.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "UIButton+DSL.h"
#import "DSLHeader.h"


#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"
@implementation UIButton (DSL)
#pragma clang diagnostic pop

- (UIButton *(^)(UIEdgeInsets))DSL_ContentEdgeInsets {
    weak_Self;
    return ^UIButton *(UIEdgeInsets contentEdgeInsets) {
        strong_Self;
        strongSelf.contentEdgeInsets = contentEdgeInsets;
        return strongSelf;
    };
}
- (UIButton *(^)(UIEdgeInsets))DSL_TitleEdgeInsets {
    weak_Self;
    return ^UIButton *(UIEdgeInsets titleEdgeInsets) {
        strong_Self;
        strongSelf.titleEdgeInsets = titleEdgeInsets;
        return strongSelf;
    };
}
- (UIButton *(^)(BOOL))DSL_ReversesTitleShadowWhenHighlighted {
    weak_Self;
    return ^UIButton *(BOOL reversesTitleShadowWhenHighlighted) {
        strong_Self;
        strongSelf.reversesTitleShadowWhenHighlighted = reversesTitleShadowWhenHighlighted;
        return strongSelf;
    };
}
- (UIButton *(^)(UIEdgeInsets))DSL_ImageEdgeInsets {
    weak_Self;
    return ^UIButton *(UIEdgeInsets imageEdgeInsets) {
        strong_Self;
        strongSelf.imageEdgeInsets = imageEdgeInsets;
        return strongSelf;
    };
}
- (UIButton *(^)(BOOL))DSL_AdjustsImageWhenHighlighted {
    weak_Self;
    return ^UIButton *(BOOL adjustsImageWhenHighlighted) {
        strong_Self;
        strongSelf.adjustsImageWhenHighlighted = adjustsImageWhenHighlighted;
        return strongSelf;
    };
}
- (UIButton *(^)(BOOL))DSL_AdjustsImageWhenDisabled {
    weak_Self;
    return ^UIButton *(BOOL adjustsImageWhenDisabled) {
        strong_Self;
        strongSelf.adjustsImageWhenDisabled = adjustsImageWhenDisabled;
        return strongSelf;
    };
}
- (UIButton *(^)(BOOL))DSL_ShowsTouchWhenHighlighted {
    weak_Self;
    return ^UIButton *(BOOL showsTouchWhenHighlighted) {
        strong_Self;
        strongSelf.showsTouchWhenHighlighted = showsTouchWhenHighlighted;
        return strongSelf;
    };
}
- (UIButton *(^)(UIColor *))DSL_TintColor {
    weak_Self;
    return ^UIButton *(UIColor *tintColor) {
        strong_Self;
        strongSelf.tintColor = tintColor;
        return strongSelf;
    };
}


@end
