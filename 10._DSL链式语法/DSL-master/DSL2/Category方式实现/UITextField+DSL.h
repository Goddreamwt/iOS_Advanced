//
//  UITextField+DSL.h
//  DSL2
//
//  Created by sw on 2018/7/29.
//  Copyright © 2018年 ws. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (DSL)
#pragma mark - UIView
- (UITextField* (^)(CGRect))DSL_frame;
- (UITextField* (^)(UIColor *))DSL_backgroundColor;

#pragma mark - UIControl
- (UITextField* (^)(BOOL))DSL_Enabled;
- (UITextField* (^)(BOOL))DSL_Selected;
- (UITextField* (^)(BOOL))DSL_Highlighted;
- (UITextField* (^)(UIControlContentVerticalAlignment))DSL_ContentVerticalAlignment;
- (UITextField* (^)(UIControlContentHorizontalAlignment))DSL_ContentHorizontalAlignment;

#pragma mark - UITextField
- (UITextField *(^)(NSString *))DSL_text;
- (UITextField *(^)(NSAttributedString *))DSL_attributedText;
- (UITextField *(^)(UIFont *))DSL_font;
- (UITextField *(^)(UIColor *))DSL_textColor;
- (UITextField *(^)(NSTextAlignment))DSL_textAlignment;
- (UITextField *(^)(UITextBorderStyle))DSL_borderStyle;
- (UITextField *(^)(NSDictionary<NSString *, id> *))DSL_defaultTextAttributes;
- (UITextField *(^)(NSString *))DSL_placeholder;
- (UITextField *(^)(NSAttributedString *))DSL_attributedPlaceholder;
- (UITextField *(^)(BOOL))DSL_clearsOnBeginEditing;
- (UITextField *(^)(BOOL))DSL_adjustsFontSizeToFitWidth;
- (UITextField *(^)(CGFloat))DSL_minimumFontSize;
- (UITextField *(^)(__weak id<UITextFieldDelegate>))DSL_delegate;
- (UITextField *(^)(UIImage *))DSL_background;
- (UITextField *(^)(UIImage *))DSL_disabledBackground;
- (UITextField *(^)(BOOL))DSL_allowsEditingTextAttributes;
- (UITextField *(^)(NSDictionary<NSString *, id> *))DSL_typingAttributes;
- (UITextField *(^)(UITextFieldViewMode))DSL_clearButtonMode;
- (UITextField *(^)(UIView *))DSL_leftView;
- (UITextField *(^)(UITextFieldViewMode))DSL_leftViewMode;
- (UITextField *(^)(UIView *))DSL_rightView;
- (UITextField *(^)(UITextFieldViewMode))DSL_rightViewMode;
- (UITextField *(^)(UIView *))DSL_inputView;
- (UITextField *(^)(UIView *))DSL_inputAccessoryView;
- (UITextField *(^)(BOOL))DSL_clearsOnInsertion;








@end
