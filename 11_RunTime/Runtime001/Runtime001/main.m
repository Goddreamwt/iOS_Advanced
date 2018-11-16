//
//  main.m
//  Runtime001
//
//  Created by hzg on 2018/9/10.
//  Copyright © 2018年 tz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TZPerson.h"
#import "TZDog.h"
#import <objc/runtime.h>


// 代码--> 编译链接--->执行

void run() {
    NSLog(@"%s", __func__);
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        run();
        TZPerson* p = [TZPerson new];
        Method m1 = class_getInstanceMethod([p class], @selector(walk));
        Method m2 = class_getInstanceMethod([p class], @selector(run));
        IMP imp = method_getImplementation(m2);
        method_setImplementation(m1, imp);
        [p walk];

//        TZDog* d = [TZDog new];
//
//        object_setClass(p, [d class]);
//       // method_setImplementation(m1, (IMP)run);
//
//        [p walk];
        
    }
    return 0;
}
