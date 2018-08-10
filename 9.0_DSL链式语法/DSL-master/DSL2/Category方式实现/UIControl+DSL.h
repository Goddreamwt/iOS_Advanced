//
//  UIControl+DSL.h
//  DSL2
//
//  Created by sw on 2018/7/28.
//  Copyright © 2018年 ws. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (DSL)
#pragma mark - UIView
- (UIControl* (^)(CGRect))DSL_frame;
- (UIControl* (^)(UIColor *))DSL_backgroundColor;

#pragma mark - UIControl
- (UIControl* (^)(BOOL))DSL_Enabled;
- (UIControl* (^)(BOOL))DSL_Selected;
- (UIControl* (^)(BOOL))DSL_Highlighted;
- (UIControl* (^)(UIControlContentVerticalAlignment))DSL_ContentVerticalAlignment;
- (UIControl* (^)(UIControlContentHorizontalAlignment))DSL_ContentHorizontalAlignment;

@end
