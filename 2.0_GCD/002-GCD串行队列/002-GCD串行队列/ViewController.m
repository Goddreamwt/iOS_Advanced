//
//  ViewController.m
//  002-GCD串行队列
//
//  Created by mac on 2018/5/4.
//  Copyright © 2018年 mac. All rights reserved.
//


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


/**
 GCD 核心概念：将任务添加到队列，指定任务执行的方法
 
 - 任务
   - 使用block封装
   - block 就是一个提前准备好的代码块，在需要的时候执行
 - 队列（负责调度任务）
   - 串行队列：一个接一个的调度任务
   - 并发队列：可以同时调度多个任务
 - 任务执行函数（任务都需要在线程中执行！）
   - 同步执行：当前指令不完成，不会执行下个指令
   - 异步执行：当前指令不完成，同样可以执行下一条指令
 
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self gcdDemo2];
}

//MARK:串行队列，异步任务
-(void)gcdDemo2{
    //1.队列 - 串行
    dispatch_queue_t q = dispatch_queue_create("WT_queue", NULL);
    //2.异步执行任务
    for (int i=0; i<10; i++) {
        NSLog(@"%d-----------",i);//在主线程中，占用主线程资源，执行完毕后才能打印come here
        dispatch_async(q, ^{
            NSLog(@"%@ %d",[NSThread currentThread],i);
        });
    }//只开一条线程
    NSLog(@"come here");//它在主线程中，与子线程同时执行
}

//MARK:串行队列，同步任务

/**
 不会开启线程，会顺序执行
 */
-(void)gcdDemo1{
    //1.队列 - 串行
    
    /**
      1.队列名称：
      2.队列属性：DISPATCH_QUEUE_SERIAL  标示串行
     */
    dispatch_queue_t q = dispatch_queue_create("WT_queue", NULL);
    //2.同步执行任务
    dispatch_sync(q, ^{
        NSLog(@"%@",[NSThread currentThread]);
    });
    
//执行结果： 2018-05-04 10:45:43.324464+0800 002-GCD串行队列[1426:71131] <NSThread: 0x60400006e6c0>{number = 1, name = main}
}










@end
