//
//  UILabel+DSL.h
//  DSL2
//
//  Created by sw on 2018/7/29.
//  Copyright © 2018年 ws. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (DSL)
#pragma mark - UIView
- (UILabel* (^)(CGRect))DSL_frame;
- (UILabel* (^)(UIColor *))DSL_backgroundColor;

#pragma mark - UILabel
- (UILabel *(^)(NSString *))DSL_text;
- (UILabel *(^)(UIFont *))DSL_font;
- (UILabel *(^)(UIColor *))DSL_textColor;
- (UILabel *(^)(UIColor *))DSL_shadowColor;
- (UILabel *(^)(CGSize))DSL_shadowOffset;
- (UILabel *(^)(NSTextAlignment))DSL_textAlignment;
- (UILabel *(^)(NSLineBreakMode))DSL_lineBreakMode;
- (UILabel *(^)(NSAttributedString *))DSL_attributedText;
- (UILabel *(^)(UIColor *))DSL_highlightedTextColor;
- (UILabel *(^)(BOOL))DSL_highlighted;
- (UILabel *(^)(BOOL))DSL_userInteractionEnabled;
- (UILabel *(^)(BOOL))DSL_enabled;
- (UILabel *(^)(NSInteger))DSL_numberOfLines;
- (UILabel *(^)(BOOL))DSL_adjustsFontSizeToFitWidth;
- (UILabel *(^)(UIBaselineAdjustment))DSL_baselineAdjustment;
- (UILabel *(^)(CGFloat))DSL_minimumScaleFactor;

- (UILabel *(^)(BOOL))DSL_allowsDefaultTighteningForTruncation;
- (UILabel *(^)(CGFloat))DSL_preferredMaxLayoutWidth;


@end
