//
//  ViewController.m
//  007-主队列演练
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
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self gcdDemo3];
}
//同步任务死锁：当前是在主线程，让主队列执行同步任务！
//MARK:主队列同步任务（不死锁的）
-(void)gcdDemo3{
    void (^task)(void)=^{
        NSLog(@"这里!!%@",[NSThread currentThread]);
        //1.队列 --一启动主线程，就可以获取主队列
        dispatch_queue_t q = dispatch_get_main_queue();
        
        //2.同步任务
        dispatch_sync(q, ^{
            NSLog(@"能来吗？%@",[NSThread currentThread]);
        });
        NSLog(@"睡一会");
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"come here");
    };
    dispatch_async(dispatch_get_global_queue(0, 0), task);
}


/**
 主队列 & 串行队列的区别
 都是 一个一个安排任务
 队列特点：FIFO
 
 -并发队列：可以调度很多任务
 -串行队列：必须等待一个任务执行完成，再调度另外一个
   - 最多只能开启一条线程
 -主队列，以FIFO调度任务，如果主线程上面有任务在执行，主队列就不会调度任务
   - 主要是负责在主线程上执行任务
 */

-(void)gcdDemo2{
    
    //主队列是专门负责在主线程上调度任务的队列 --》不会开现场
    
    //1.队列 --一启动主线程，就可以获取主队列
    dispatch_queue_t q = dispatch_get_main_queue();
    
    //2.同步任务：同步执行的任务特点：这句话不执行完毕，就不能执行下一句，阻塞式
    dispatch_sync(q, ^{
        NSLog(@"%@",[NSThread currentThread]);
    });//互相锁死
    
    NSLog(@"come here");
}

-(void)gcdDemo1{
    //主队列是专门负责在主线程上调度任务的队列 --》不会开现场
    
    //1.队列 --一启动主线程，就可以获取主队列
    dispatch_queue_t q = dispatch_get_main_queue();
    
    //2.异步任务
    dispatch_async(q, ^{
        NSLog(@"%@",[NSThread currentThread]);
    });
    for (int i=0; i<10; i++) {
        NSLog(@"come here");
    }
}
@end
