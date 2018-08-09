//
//  UIControl+DSL.m
//  DSL2
//
//  Created by sw on 2018/7/28.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "UIControl+DSL.h"
#import "DSLHeader.h"


#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"
@implementation UIControl (DSL)
#pragma clang diagnostic pop

- (UIControl* (^)(BOOL))DSL_Enabled {
    weak_Self;
    return ^UIControl *(BOOL enabled) {
        strong_Self;
        strongSelf.enabled = enabled;
        return strongSelf;
    };
}
- (UIControl* (^)(BOOL))DSL_Selected {
    weak_Self;
    return ^UIControl *(BOOL selected) {
        strong_Self;
        strongSelf.selected = selected;
        return  strongSelf;
    };
}
- (UIControl* (^)(BOOL))DSL_Highlighted {
    weak_Self;
    return ^UIControl *(BOOL highlighted) {
        strong_Self;
        strongSelf.highlighted = highlighted;
        return strongSelf;
    };
}
- (UIControl* (^)(UIControlContentVerticalAlignment))DSL_ContentVerticalAlignment {
    weak_Self;
    return ^UIControl *(UIControlContentVerticalAlignment contentVerticalAlignment) {
        strong_Self;
        strongSelf.contentVerticalAlignment = contentVerticalAlignment;
        return strongSelf;
    };
}
- (UIControl* (^)(UIControlContentHorizontalAlignment))DSL_ContentHorizontalAlignment {
    weak_Self;
    return ^UIControl *(UIControlContentHorizontalAlignment contentHorizontalAlignment) {
        strong_Self;
        strongSelf.contentHorizontalAlignment = contentHorizontalAlignment;
        return strongSelf;
    };
}

@end
