//
//  ViewController.m
//  005-GCD延时执行
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
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self testOnce];
}

//一次执行
/**
  在单例设计模式里面，非常普遍
 */
-(void)once{
    NSLog(@"来了！！");
    //苹果提供了 一次执行机制，不仅能够保证一次执行而且是线程安全的
    static dispatch_once_t onceToken;
    NSLog(@"%ld",onceToken);
    //苹果推荐使用gcd 一次执行，效率高
    //不要使用互斥锁，效率低
    dispatch_once(&onceToken, ^{
        //只会执行一次
        NSLog(@"执行了%@",[NSThread currentThread]);
    });
}

-(void)testOnce{
    for (int i=0;i<10; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [self once];
        });
    }
}
//延迟执行
-(void)delay{
    NSLog(@"come here");
    
    /**
     参数：
      1.when 时间 从现在开始，经过多少纳秒之后，让queue队列调度block任务，异步执行
      2.queue 队列
      3.block 代码块
     */
    dispatch_time_t when = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));
    dispatch_queue_t q = dispatch_queue_create("WT_queue", NULL);
    dispatch_after(when, q, ^{
        NSLog(@"%@",[NSThread currentThread]);
    });
}

@end
