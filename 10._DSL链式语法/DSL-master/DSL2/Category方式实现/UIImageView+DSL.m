//
//  UIImageView+DSL.m
//  DSL2
//
//  Created by sw on 2018/7/28.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "UIImageView+DSL.h"
#import "DSLHeader.h"



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"
@implementation UIImageView (DSL)
#pragma clang diagnostic pop

#pragma mark - UIImageView
- (UIImageView* (^)(UIImage *))DSL_image {
    weak_Self;
    return ^UIImageView *(UIImage *image) {
        strong_Self;
        strongSelf.image = image;
        return strongSelf;
    };
}
- (UIImageView* (^)(UIImage *))DSL_HighlightedImage {
    weak_Self;
    return ^UIImageView *(UIImage *highlightedImage) {
        strong_Self;
        strongSelf.highlightedImage = highlightedImage;
        return self;
    };
}
- (UIImageView* (^)(BOOL))DSL_UserInteractionEnabled {
    weak_Self;
    return ^UIImageView *(BOOL userInteractionEnabled) {
        strong_Self;
        strongSelf.userInteractionEnabled = userInteractionEnabled;
        return strongSelf;
    };
}
- (UIImageView* (^)(BOOL))DSL_highlighted {
    weak_Self;
    return ^UIImageView *(BOOL highlighted) {
        strong_Self;
        strongSelf.highlighted = highlighted;
        return strongSelf;
    };
}
- (UIImageView* (^)(NSArray <UIImage *> *))DSL_AnimationImages {
    weak_Self;
    return ^UIImageView *(NSArray <UIImage *> *animationImages) {
        strong_Self;
        strongSelf.animationImages = animationImages;
        return self;
    };
}
- (UIImageView* (^)(NSArray <UIImage *> *))DSL_HighlightedAnimationImages {
    weak_Self;
    return ^UIImageView *(NSArray <UIImage *> *highlightedAnimationImages) {
        strong_Self;
        strongSelf.highlightedAnimationImages = highlightedAnimationImages;
        return self;
    };
}
- (UIImageView* (^)(NSTimeInterval))DSL_AnimationDuration {
    weak_Self;
    return ^UIImageView *(NSTimeInterval animationDuration) {
        strong_Self;
        strongSelf.animationDuration = animationDuration;
        return strongSelf;
    };
}
- (UIImageView* (^)(NSInteger))SDL_AnimationRepeatCount {
    weak_Self;
    return ^UIImageView *(NSInteger animationRepeatCount) {
        strong_Self;
        strongSelf.animationRepeatCount = animationRepeatCount;
        return strongSelf;
    };
}
- (UIImageView* (^)(UIColor *))DSL_TintColor {
    weak_Self;
    return ^UIImageView *(UIColor * tintColor) {
        strong_Self;
        strongSelf.tintColor = tintColor;
        return strongSelf;
    };
}

/// 只读属性
- (BOOL)DSL_Animating {
    return self.animating;
}
@end
