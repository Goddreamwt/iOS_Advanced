//
//  UIView+DSLMaker.h
//  DSL3
//
//  Created by sw on 2018/7/31.
//  Copyright © 2018年 ws. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DSLViewMaker;

@interface UIView (DSLMaker)
+ (DSLViewMaker *)make;
@end
