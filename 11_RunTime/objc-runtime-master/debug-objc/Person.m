//
//  Person.m
//  debug-objc
//
//  Created by hzg on 2018/8/16.
//

#import "Person.h"
#import "Dog.h"

@implementation Person

//- (void) sendMessage:(int) message {
//    NSLog(@"messeage = %@", message);
//}

//+ (BOOL) resolveInstanceMethod:(SEL)sel {
//
//    NSLog(@"%s", __func__);
//    return [super resolveInstanceMethod:sel];
//}

- (id) forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(test)) {
        return [Dog new];
    }
    return [super forwardingTargetForSelector:aSelector];
}

@end
