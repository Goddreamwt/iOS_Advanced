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

struct method_t {
    SEL name;
    const char *types;
    IMP imp;
    
//    struct SortBySELAddress :
//    public std::binary_function<const method_t&,
//    const method_t&, bool>
//    {
//        bool operator() (const method_t& lhs,
//                         const method_t& rhs)
//        { return lhs.name < rhs.name; }
//    };
};


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        run();
        TZPerson* p = [TZPerson new];
//        Method m1 = class_getInstanceMethod([p class], @selector(walk));
//        struct method_t * m2 = class_getInstanceMethod([p class], @selector(run));
//        IMP imp = method_getImplementation(m2);
//        method_setImplementation(m1, m2->imp);
//        method_setImplementation(m1, (IMP)run);
//        [p walk];

        TZDog* d = [TZDog new];
        object_setClass(p, [d class]);
       // method_setImplementation(m1, (IMP)run);
        [p walk];
        
    }
    return 0;
}
