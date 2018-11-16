//
//  TZPerson.m
//  Runtime001
//
//  Created by hzg on 2018/9/10.
//  Copyright © 2018年 tz. All rights reserved.
//

#import "TZPerson.h"
#import "TZDog.h"
#import <objc/runtime.h>

@implementation TZPerson

- (id) forwardingTargetForSelector:(SEL)aSelector {
    
//    if (aSelector == @selector(walk)) {
//        return [TZDog new];
//    }
    
    return [super forwardingTargetForSelector:aSelector];
}

/// 方法名注册
- (NSMethodSignature* ) methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(walk)) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void) forwardInvocation:(NSInvocation *)anInvocation {
    
   // NSLog(@"%s", __func__);
    
   // [anInvocation invokeWithTarget:[TZDog new]];
    
    /// 转发给自己
    anInvocation.selector = @selector(run);
   // anI
    [anInvocation invoke];
}

- (void) run {
    NSLog(@"%s", __func__);
}

@end
