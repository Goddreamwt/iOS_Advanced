//
//  UIViewController+Hook.m
//  Runtime007
//
//  Created by hzg on 2018/9/10.
//  Copyright © 2018年 tz. All rights reserved.
//

#import "UIViewController+Hook.h"
#import <objc/runtime.h>

@implementation UIViewController (Hook)

+ (void) load {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method m1 = class_getInstanceMethod(self, @selector(viewWillAppear:));
        Method m2 = class_getInstanceMethod(self, @selector(tz_viewWillAppear:));
        
        
        method_exchangeImplementations(m1, m2);
        
        
    });
    
}

- (void) tz_viewWillAppear:(BOOL) animated {
    NSLog(@"%s", __func__);
    [self tz_viewWillAppear:animated];
}

@end
