//
//  main.m
//  Runtime001
//
//  Created by hzg on 2018/9/10.
//  Copyright © 2018年 tz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TZPerson.h"
#import <objc/message.h>



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        TZPerson * p =[TZPerson new];
//        [p walk];
        
//        NSLog(@"%p,%p",@selector(walk),sel_registerName("walk"));
//        objc_msgSend(p, sel_registerName("walk"));
//         objc_msgSend(p, @selector(walk));
        
        [TZPerson run];
        objc_msgSend(objc_getClass("TZPerson"), @selector(run));
       
         TZPerson* p = [TZPerson new];
        [p walk];

        objc_msgSend(p, @selector(walk));
        
        // 本质是消息机制: 消息接收者  消息名称
        
    }
    return 0;
}
