//
//  UIView+DSL.m
//  DSL2
//
//  Created by sw on 2018/7/28.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "UIView+DSL.h"
#import "DSLHeader.h"

@implementation UIView (DSL)
- (UIView *(^)(CGRect))DSL_frame {
    weak_Self;
    return ^UIView* (CGRect frame) {
        strong_Self;
        strongSelf.frame = frame;
        return strongSelf;
    };
}

- (UIView *(^)(UIColor *))DSL_backgroundColor {
    weak_Self;
    return ^UIView* (UIColor *backgroundColor) {
        strong_Self;
        strongSelf.backgroundColor = backgroundColor;
        return strongSelf;
    };
}
@end
