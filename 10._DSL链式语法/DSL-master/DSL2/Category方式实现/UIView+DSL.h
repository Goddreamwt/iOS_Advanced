//
//  UIView+DSL.h
//  DSL2
//
//  Created by sw on 2018/7/28.
//  Copyright © 2018年 ws. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DSL)
- (UIView* (^)(CGRect))DSL_frame;
- (UIView* (^)(UIColor *))DSL_backgroundColor;
@end
