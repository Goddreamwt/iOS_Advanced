//
//  ViewController.m
//  004-GCD演示
//
//  Created by mac on 2018/5/7.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self gcdDemo8];
}


-(void)gcdDemo8{
    /**
     全局队列 & 并发队列  区别
     1> 名称，并发队列取名字，适合于企业开发跟踪错误
     2> release，在MRC 并发队列 需要使用的
        dispatch_release(q);//ARC情况下不需要release！
     
     
     全局队列 & 串行队列
        全局队列：并发，能够调度多个线程，执行效率高
          -费电
        串行队列：一个一个执行，执行效率低
          -省电
     
        判断依据：用户上网方式
         -WIFI：可以多开线程
         -流量：尽量少开线程
     */
    //1.队列
    dispatch_queue_t q = dispatch_queue_create("WT_queue", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_queue_t q =dispatch_get_global_queue(0, 0);
    for (int i=0; i<10; i++) {
        dispatch_async(q, ^{
            NSLog(@"%@ %d",[NSThread currentThread],i);
        });
    }

    NSLog(@"come here");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
