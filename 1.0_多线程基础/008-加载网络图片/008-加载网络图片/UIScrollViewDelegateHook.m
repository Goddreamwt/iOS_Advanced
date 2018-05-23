//
//  UIScrollViewDelegateHook.m
//  008-加载网络图片
//
//  Created by mac on 2018/5/8.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "UIScrollViewDelegateHook.h"
#import <objc/runtime.h>

static void hook_exchangeMethod(Class originalClass, SEL originalSel, Class replacedClass, SEL replacedSel){
    Method originalMethod = class_getInstanceMethod(originalClass, originalSel);
    //    assert(originalMethod);
    
    Method replacedMethod = class_getInstanceMethod(replacedClass, replacedSel);
    //    assert(replacedMethod);
    IMP replacedMethodIMP = method_getImplementation(replacedMethod);
    
    BOOL didAddMethod =
    class_addMethod(originalClass,
                    replacedSel,
                    replacedMethodIMP,
                    method_getTypeEncoding(replacedMethod));
    
    if (didAddMethod) {
        NSLog(@"class_addMethod succeed --> (%@)", NSStringFromSelector(replacedSel));
        Method newMethod = class_getInstanceMethod(originalClass, replacedSel);
        method_exchangeImplementations(originalMethod, newMethod);
    }
    else {
            NSLog(@"class_addMethod fail --> (%@)", NSStringFromSelector(replacedSel));
        }
}
//static void hook_exchangeMethod(Class originalClass, SEL originalSel, Class replacedClass, SEL replacedSel)
//{
//    static NSMutableArray *classList = nil;
//    if (classList == nil) {
//        classList = [NSMutableArray array];
//    }
//    NSString *className = [NSString stringWithFormat:@"%@__%@", NSStringFromClass(originalClass), NSStringFromSelector(originalSel)];
//    NSLog(@"%@",className);
//    for (NSString *item in classList) {
//        // 防止 setDelegate 方法被调用多次,导致代理方法又被换掉
//        if ([className isEqualToString:item]) {
//            return;
//        }
//    }
//    [classList addObject:className];
//    Method originalMethod = class_getInstanceMethod(originalClass, originalSel);
//    assert(originalMethod);
//    Method replacedMethod = class_getInstanceMethod(replacedClass, replacedSel);
//    assert(replacedMethod);
//    IMP replacedMethodIMP = method_getImplementation(replacedMethod);
//    BOOL didAddMethod =
//    class_addMethod(originalClass,
//                    replacedSel,
//                    replacedMethodIMP,
//                    method_getTypeEncoding(replacedMethod));
//    if (didAddMethod) {
//        NSLog(@"class_addMethod failed --> (%@)", NSStringFromSelector(replacedSel));
//    } else {
//        NSLog(@"class_addMethod succeed --> (%@)", NSStringFromSelector(replacedSel));
//    }
//    Method newMethod = class_getInstanceMethod(originalClass, replacedSel);
//    method_exchangeImplementations(originalMethod, newMethod);
//}


@implementation UIScrollViewDelegateHook

+ (void)exchangeUIScrollViewDelegateMethod:(Class)aClass{
    // hook它的scrollViewDidScroll代理方法
    hook_exchangeMethod(aClass, @selector(scrollViewDidScroll:), [self class], @selector(replace_scrollViewDidScroll:));
}

- (void)replace_scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"replace_scrollViewDidScroll");
    [self replace_scrollViewDidScroll:scrollView];
}

@end
