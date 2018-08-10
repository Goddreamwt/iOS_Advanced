//
//  UIView+DSLMaker.m
//  DSL3
//
//  Created by sw on 2018/7/31.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "UIView+DSLMaker.h"
#import "DSLViewMaker.h"

@implementation UIView (DSLMaker)
+ (DSLViewMaker *)make {
    return [DSLViewMaker new];
}

@end
