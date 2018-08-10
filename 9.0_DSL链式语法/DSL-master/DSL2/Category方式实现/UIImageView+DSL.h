//
//  UIImageView+DSL.h
//  DSL2
//
//  Created by sw on 2018/7/28.
//  Copyright © 2018年 ws. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (DSL)
#pragma mark - UIView
- (UIImageView* (^)(CGRect))DSL_frame;
- (UIImageView* (^)(UIColor *))DSL_backgroundColor;

#pragma mark - UIView
- (UIImageView* (^)(UIImage *))DSL_image;
- (UIImageView* (^)(UIImage *))DSL_HighlightedImage;
- (UIImageView* (^)(BOOL))DSL_UserInteractionEnabled;
- (UIImageView* (^)(BOOL))DSL_highlighted;
- (UIImageView* (^)(NSArray <UIImage *> *))DSL_AnimationImages;
- (UIImageView* (^)(NSArray <UIImage *> *))DSL_HighlightedAnimationImages;
- (UIImageView* (^)(NSTimeInterval))DSL_AnimationDuration;
- (UIImageView* (^)(NSInteger))SDL_AnimationRepeatCount;
- (UIImageView* (^)(UIColor *))DSL_TintColor;
/// 只读属性
- (BOOL)DSL_Animating;

@end
