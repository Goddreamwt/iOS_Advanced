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


+ (void) run {
    NSLog(@"%s", __func__);
}

+ (BOOL)resolveClassMethod:(SEL)sel {
    
    if (sel == @selector(walk)) {
        Method runMethod = class_getClassMethod(self, @selector(run));
        IMP runIMP = method_getImplementation(runMethod);
        const char* types = method_getTypeEncoding(runMethod);
        NSLog(@"%s", types);
        return class_addMethod(object_getClass(self), sel, runIMP, types);
    }
    return [super resolveClassMethod:sel];
}

@end
