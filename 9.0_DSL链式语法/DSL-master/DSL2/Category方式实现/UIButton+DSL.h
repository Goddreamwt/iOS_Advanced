//
//  UIButton+DSL.h
//  DSL2
//
//  Created by sw on 2018/7/28.
//  Copyright © 2018年 ws. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (DSL)
#pragma mark - UIView
- (UIButton* (^)(CGRect))DSL_frame;
- (UIButton* (^)(UIColor *))DSL_backgroundColor;

#pragma mark - UIControl
- (UIButton* (^)(BOOL))DSL_Enabled;
- (UIButton* (^)(BOOL))DSL_Selected;
- (UIButton* (^)(BOOL))DSL_Highlighted;
- (UIButton* (^)(UIControlContentVerticalAlignment))DSL_ContentVerticalAlignment;
- (UIButton* (^)(UIControlContentHorizontalAlignment))DSL_ContentHorizontalAlignment;

#pragma mark - UIButton
- (UIButton *(^)(UIEdgeInsets))DSL_ContentEdgeInsets;
- (UIButton *(^)(UIEdgeInsets))DSL_TitleEdgeInsets;
- (UIButton *(^)(BOOL))DSL_ReversesTitleShadowWhenHighlighted;
- (UIButton *(^)(UIEdgeInsets))DSL_ImageEdgeInsets;
- (UIButton *(^)(BOOL))DSL_AdjustsImageWhenHighlighted;
- (UIButton *(^)(BOOL))DSL_AdjustsImageWhenDisabled;
- (UIButton *(^)(BOOL))DSL_ShowsTouchWhenHighlighted;
- (UIButton *(^)(UIColor *))DSL_TintColor;


@end
