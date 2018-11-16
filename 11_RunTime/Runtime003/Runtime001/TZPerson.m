//
//  TZPerson.m
//  Runtime001
//
//  Created by hzg on 2018/9/10.
//  Copyright © 2018年 tz. All rights reserved.
//

#import "TZPerson.h"
#import <objc/runtime.h>

@implementation TZPerson

//- (void) walk {
//    NSLog(@"%s", __func__);
//}

//void walk() {
//    NSLog(@"%s", __func__);
//}

- (void) run {
    NSLog(@"%s", __func__);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"%s", __func__);
    
//    // 元类
//    // 实例对象、类对象、元类对象
//    if (sel == @selector(walk)) {
//        return class_addMethod(self, sel, (IMP)walk, "v@:");
//    }
    
    if (sel == @selector(walk)) {
        Method runMethod = class_getInstanceMethod(self, @selector(run));
        IMP runIMP = method_getImplementation(runMethod);
        const char* types = method_getTypeEncoding(runMethod);
        NSLog(@"%s", types);
        return class_addMethod(self, sel, runIMP, types);
    }
    

    
    return [super resolveInstanceMethod:sel];
}

@end
