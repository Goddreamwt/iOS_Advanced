//
//  UITextField+DSL.m
//  DSL2
//
//  Created by sw on 2018/7/29.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "UITextField+DSL.h"
#import "DSLHeader.h"


#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"
@implementation UITextField (DSL)
#pragma clang diagnostic pop

- (UITextField *(^)(NSString *))DSL_text {
    weak_Self;
    return ^UITextField *(NSString *text) {
        strong_Self;
        strongSelf.text = text;
        return strongSelf;
    };
}
- (UITextField *(^)(NSAttributedString *))DSL_attributedText {
    weak_Self;
    return ^UITextField *(NSAttributedString *attributedText) {
        strong_Self;
        strongSelf.attributedText = attributedText;
        return strongSelf;
    };
}
- (UITextField *(^)(UIFont *))DSL_font {
    weak_Self;
    return ^UITextField *(UIFont *font) {
        strong_Self;
        strongSelf.font = font;
        return strongSelf;
    };
}
- (UITextField *(^)(UIColor *))DSL_textColor {
    weak_Self;
    return ^UITextField *(UIColor *textColor) {
        strong_Self;
        strongSelf.textColor = textColor;
        return strongSelf;
    };
}
- (UITextField *(^)(NSTextAlignment))DSL_textAlignment {
    weak_Self;
    return ^UITextField *(NSTextAlignment textAlignment) {
        strong_Self;
        strongSelf.textAlignment = textAlignment;
        return strongSelf;
    };
}
- (UITextField *(^)(UITextBorderStyle))DSL_borderStyle {
    weak_Self;
    return ^UITextField *(UITextBorderStyle borderStyle) {
        strong_Self;
        strongSelf.borderStyle = borderStyle;
        return strongSelf;
    };
}
- (UITextField *(^)(NSDictionary<NSString *, id> *))DSL_defaultTextAttributes {
    weak_Self;
    return ^UITextField *(NSDictionary<NSString *, id> *defaultTextAttributes) {
        strong_Self;
        strongSelf.defaultTextAttributes = defaultTextAttributes;
        return strongSelf;
    };
}
- (UITextField *(^)(NSString *))DSL_placeholder {
    weak_Self;
    return ^UITextField *(NSString *placeholder) {
        strong_Self;
        strongSelf.placeholder = placeholder;
        return strongSelf;
    };
}
- (UITextField *(^)(NSAttributedString *))DSL_attributedPlaceholder {
    weak_Self;
    return ^UITextField *(NSAttributedString *attributedPlaceholder) {
        strong_Self;
        strongSelf.attributedPlaceholder = attributedPlaceholder;
        return strongSelf;
    };
}
- (UITextField *(^)(BOOL))DSL_clearsOnBeginEditing {
    weak_Self;
    return ^UITextField *(BOOL clearsOnBeginEditing) {
        strong_Self;
        strongSelf.clearsOnBeginEditing = clearsOnBeginEditing;
        return strongSelf;
    };
}
- (UITextField *(^)(BOOL))DSL_adjustsFontSizeToFitWidth {
    weak_Self;
    return ^UITextField *(BOOL adjustsFontSizeToFitWidth) {
        strong_Self;
        strongSelf.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth;
        return strongSelf;
    };
}
- (UITextField *(^)(CGFloat))DSL_minimumFontSize {
    weak_Self;
    return ^UITextField *(CGFloat minimumFontSize) {
        strong_Self;
        strongSelf.minimumFontSize = minimumFontSize;
        return strongSelf;
    };
}
- (UITextField *(^)(__weak id<UITextFieldDelegate>))DSL_delegate {
    weak_Self;
    return ^UITextField *(__weak id<UITextFieldDelegate> delegate) {
        strong_Self;
        strongSelf.delegate = delegate;
        return strongSelf;
    };
}
- (UITextField *(^)(UIImage *))DSL_background {
    weak_Self;
    return ^UITextField *(UIImage *background) {
        strong_Self;
        strongSelf.background = background;
        return strongSelf;
    };
}
- (UITextField *(^)(UIImage *))DSL_disabledBackground {
    weak_Self;
    return ^UITextField *(UIImage *disabledBackground) {
        strong_Self;
        strongSelf.disabledBackground = disabledBackground;
        return strongSelf;
    };
}
- (UITextField *(^)(BOOL))DSL_allowsEditingTextAttributes {
    weak_Self;
    return ^UITextField *(BOOL allowsEditingTextAttributes) {
        strong_Self;
        strongSelf.allowsEditingTextAttributes = allowsEditingTextAttributes;
        return strongSelf;
    };
}
- (UITextField *(^)(NSDictionary<NSString *, id> *))DSL_typingAttributes {
    weak_Self;
    return ^UITextField *(NSDictionary<NSString *, id> *typingAttributes) {
        strong_Self;
        strongSelf.typingAttributes = typingAttributes;
        return strongSelf;
    };
}
- (UITextField *(^)(UITextFieldViewMode))DSL_clearButtonMode {
    weak_Self;
    return ^UITextField *(UITextFieldViewMode clearButtonMode) {
        strong_Self;
        strongSelf.clearButtonMode = clearButtonMode;
        return strongSelf;
    };
}
- (UITextField *(^)(UIView *))DSL_leftView {
    weak_Self;
    return ^UITextField *(UIView *leftView) {
        strong_Self;
        strongSelf.leftView = leftView;
        return strongSelf;
    };
}
- (UITextField *(^)(UITextFieldViewMode))DSL_leftViewMode {
    weak_Self;
    return ^UITextField *(UITextFieldViewMode leftViewMode) {
        strong_Self;
        strongSelf.leftViewMode = leftViewMode;
        return strongSelf;
    };
}
- (UITextField *(^)(UIView *))DSL_rightView {
    weak_Self;
    return ^UITextField *(UIView *rightView) {
        strong_Self;
        strongSelf.rightView = rightView;
        return strongSelf;
    };
}
- (UITextField *(^)(UITextFieldViewMode))DSL_rightViewMode {
    weak_Self;
    return ^UITextField *(UITextFieldViewMode rightViewMode) {
        strong_Self;
        strongSelf.rightViewMode = rightViewMode;
        return strongSelf;
    };
}
- (UITextField *(^)(UIView *))DSL_inputView {
    weak_Self;
    return ^UITextField *(UIView *inputView) {
        strong_Self;
        strongSelf.inputView = inputView;
        return strongSelf;
    };
}
- (UITextField *(^)(UIView *))DSL_inputAccessoryView {
    weak_Self;
    return ^UITextField *(UIView *inputAccessoryView) {
        strong_Self;
        strongSelf.inputAccessoryView = inputAccessoryView;
        return strongSelf;
    };
}
- (UITextField *(^)(BOOL))DSL_clearsOnInsertion {
    weak_Self;
    return ^UITextField *(BOOL clearsOnInsertion) {
        strong_Self;
        strongSelf.clearsOnInsertion = clearsOnInsertion;
        return strongSelf;
    };
}

@end
