//
//  ViewController.m
//  006-GCD调度组
//
//  Created by mac on 2018/5/8.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self group1];
}

-(void)group1{
    //1.队列
    dispatch_queue_t q = dispatch_get_global_queue(0, 0);
    
    //2.调度组
    dispatch_group_t g = dispatch_group_create();
    
    //3.添加任务，让队列调度，任务执行情况，最后通知群组
    dispatch_group_async(g, q, ^{
        NSLog(@"download A%@",[NSThread currentThread]);
    });
    
    dispatch_group_async(g, q, ^{
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"download B%@",[NSThread currentThread]);
    });
    
    dispatch_group_async(g, q, ^{
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"download C%@",[NSThread currentThread]);
    });
    
    //4.所有任务执行完毕后，通知
    //用一个调度组，可以监听全局队列的任务，主队列去执行最后的任务
    //dispatch_group_notify 本身也是异步的
    dispatch_group_notify(g, dispatch_get_main_queue(), ^{
        //更新UI，通知用户
        NSLog(@"OK %@",[NSThread currentThread]);
    });
    
    NSLog(@"come here");
}


@end
