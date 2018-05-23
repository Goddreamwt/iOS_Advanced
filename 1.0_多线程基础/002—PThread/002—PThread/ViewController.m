//
//  ViewController.m
//  002—PThread
//
//  Created by mac on 2018/4/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self pthreadDemo];
}

-(void)pthreadDemo{
    //注意：多线程开发中，千万不要相信一次的执行结果！！！
    /*
     pthread 是属于 POSIX 多线程开发框架
     参数：
     1.指向线程代号的指针
     2.线程的属性
     3.指向函数的指针
     4.传递给该函数的参数
     
     返回值
     -如果是0，表示正确
     -如果非0，表示错误代码
     void*  (*)(void *)
     返回值  （函数指针） （参数）
     void* 和OC中的id是等价的！
     */
    NSString * str = @"hello wt";
    pthread_t threadId;
    /*
     -在 ARC 开发中，如果涉及到和C语言中的相同的数据类型进行转换，需要使用__bridge "桥接"
     -在 MRC 不需要
     */
    int result = pthread_create(&threadId, NULL,&demo, (__bridge void *)(str));
    if(result == 0){
        NSLog(@"OK");
    }else{
        NSLog(@"error %d",result);
    }
}
//定义一个函数
void * demo(void * param){
    NSLog(@"%@ %@",[NSThread currentThread],param);
    return  NULL;
}

@end
