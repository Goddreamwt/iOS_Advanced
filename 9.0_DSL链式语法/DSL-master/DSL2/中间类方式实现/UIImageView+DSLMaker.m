//
//  UIImageView+DSLMaker.m
//  DSL2
//
//  Created by sw on 2018/8/1.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "UIImageView+DSLMaker.h"

@implementation UIImageView (DSLMaker)
+ (DSLImageViewMaker *)make {
    return [DSLImageViewMaker new];
}
@end
