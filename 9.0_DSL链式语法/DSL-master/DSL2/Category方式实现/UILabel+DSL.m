//
//  UILabel+DSL.m
//  DSL2
//
//  Created by sw on 2018/7/29.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "UILabel+DSL.h"
#import "DSLHeader.h"



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"
@implementation UILabel (DSL)
#pragma clang diagnostic pop

- (UILabel *(^)(NSString *))DSL_text {
    weak_Self;
    return ^UILabel *(NSString *text) {
        strong_Self;
        strongSelf.text = text;
        return strongSelf;
    };
}
- (UILabel *(^)(UIFont *))DSL_font {
    weak_Self;
    return ^UILabel *(UIFont *font) {
        strong_Self;
        strongSelf.font = font;
        return strongSelf;
    };
}
- (UILabel *(^)(UIColor *))DSL_textColor {
    weak_Self;
    return ^UILabel *(UIColor *textColor) {
        strong_Self;
        strongSelf.textColor = textColor;
        return strongSelf;
    };
}
- (UILabel *(^)(UIColor *))DSL_shadowColor {
    weak_Self;
    return ^UILabel *(UIColor *shadowColor) {
        strong_Self;
        strongSelf.shadowColor = shadowColor;
        return strongSelf;
    };
}
- (UILabel *(^)(CGSize))DSL_shadowOffset {
    weak_Self;
    return ^UILabel *(CGSize shadowOffset) {
        strong_Self;
        strongSelf.shadowOffset = shadowOffset;
        return strongSelf;
    };
};
- (UILabel *(^)(NSTextAlignment))DSL_textAlignment {
    weak_Self;
    return ^UILabel *(NSTextAlignment textAlignment) {
        strong_Self;
        strongSelf.textAlignment = textAlignment;
        return strongSelf;
    };
}
- (UILabel *(^)(NSLineBreakMode))DSL_lineBreakMode {
    weak_Self;
    return ^UILabel *(NSLineBreakMode lineBreakModel) {
        strong_Self;
        strongSelf.lineBreakMode = lineBreakModel;
        return strongSelf;
    };
}
- (UILabel *(^)(NSAttributedString *))DSL_attributedText {
    weak_Self;
    return ^UILabel *(NSAttributedString *attributedText) {
        strong_Self;
        strongSelf.attributedText = attributedText;
        return strongSelf;
    };
}
- (UILabel *(^)(UIColor *))DSL_highlightedTextColor {
    weak_Self;
    return ^UILabel *(UIColor *highlightedTextColor) {
        strong_Self;
        strongSelf.highlightedTextColor = highlightedTextColor;
        return strongSelf;
    };
}
- (UILabel *(^)(BOOL))DSL_highlighted {
    weak_Self;
    return ^UILabel *(BOOL highlighted) {
        strong_Self;
        strongSelf.highlighted = highlighted;
        return strongSelf;
    };
}
- (UILabel *(^)(BOOL))DSL_userInteractionEnabled {
    weak_Self;
    return ^UILabel *(BOOL userInteractionEnabled) {
        strong_Self;
        strongSelf.userInteractionEnabled = userInteractionEnabled;
        return strongSelf;
    };
}
- (UILabel *(^)(BOOL))DSL_enabled {
    weak_Self;
    return ^UILabel *(BOOL enabled) {
        strong_Self;
        strongSelf.enabled = enabled;
        return strongSelf;
    };
}
- (UILabel *(^)(NSInteger))DSL_numberOfLines {
    weak_Self;
    return ^UILabel *(NSInteger numberOfLines) {
        strong_Self;
        strongSelf.numberOfLines = numberOfLines;
        return strongSelf;
    };
}
- (UILabel *(^)(BOOL))DSL_adjustsFontSizeToFitWidth {
    weak_Self;
    return ^UILabel *(BOOL adjustsFontSizeToFitWidth) {
        strong_Self;
        strongSelf.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth;
        return strongSelf;
    };
}
- (UILabel *(^)(UIBaselineAdjustment))DSL_baselineAdjustment {
    weak_Self;
    return ^UILabel *(UIBaselineAdjustment baselineAdjustment) {
        strong_Self;
        strongSelf.baselineAdjustment = baselineAdjustment;
        return strongSelf;
    };
}
- (UILabel *(^)(CGFloat))DSL_minimumScaleFactor {
    weak_Self;
    return ^UILabel *(CGFloat minimumScaleFactor) {
        strong_Self;
        strongSelf.minimumScaleFactor = minimumScaleFactor;
        return strongSelf;
    };
}

- (UILabel *(^)(BOOL))DSL_allowsDefaultTighteningForTruncation {
    weak_Self;
    return ^UILabel *(BOOL allowsDefaultTighteningForTruncation) {
        strong_Self;
        strongSelf.allowsDefaultTighteningForTruncation = allowsDefaultTighteningForTruncation;
        return strongSelf;
    };
}
- (UILabel *(^)(CGFloat))DSL_preferredMaxLayoutWidth {
    weak_Self;
    return ^UILabel *(CGFloat preferredMaxLayoutWidth) {
        strong_Self;
        strongSelf.preferredMaxLayoutWidth = preferredMaxLayoutWidth;
        return strongSelf;
    };
}



@end
