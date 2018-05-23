//
//  ViewController.m
//  003-GCD并发队列
//
//  Created by mac on 2018/5/4.
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
    [self gcdDemo7];
}

//MARK: 全局队列
-(void)gcdDemo7{
    //全局队列(本质上是并发队列)
    
    /**
     参数
      1.涉及到系统适配
      iOS 8 服务质量
       QOS_CLASS_USER_INTERACTIVE   //用户交互(希望线程快速被执行，不要用耗时的操作)
       QOS_CLASS_USER_INITIATED     //用户需要的（同样不要使用耗时操作）
       QOS_CLASS_DEFAULT            //默认的（给系统来重置队列的）
       QOS_CLASS_UTILITY            //使用工具（用来做耗时操作）
       QOS_CLASS_BACKGROUND         //后台
       QOS_CLASS_UNSPECIFIED        //没有指定优先级
     
      iOS 7 调度的优先级
       - DISPATCH_QUEUE_PRIORITY_HIGH 2     //高优先级
       - DISPATCH_QUEUE_PRIORITY_DEFAULT 0  //默认优先级
       - DISPATCH_QUEUE_PRIORITY_LOW (-2)   //低优先级
       - DISPATCH_QUEUE_PRIORITY_BACKGROUND INT16_MIN //后台优先级
     
     提示：不管是优先级还是服务质量，尤其不要选择BACKGROUND。如果选择线程执行会慢到令人发指！
     
       2.为未来使用的一个保留，现在始终给0
     
     在老项目中，一般还是没有淘汰iOS 7，没法使用服务质量
     */
    dispatch_queue_t q = dispatch_get_global_queue(0, 0);
 
    for (int i=0; i<10; i++) {
        dispatch_async(q, ^{
            NSLog(@"%@ %d",[NSThread currentThread],i);
        });
    }
    
    NSLog(@"come here");
}

#pragma mark -<同步任务>

//MARK: - 增强版同步任务
//可以让队列调度多个任务前，指定一个同步任务。让所有的异步任务，等待同步任务执行完成，这就是依赖关系
// - 同步任务，会造成一个死锁，锁住此线程
-(void)gcdDemo6{
    //队列
    dispatch_queue_t q =dispatch_queue_create("WT_queue", DISPATCH_QUEUE_CONCURRENT);
    //任务
    void (^task)(void)=^{
        dispatch_async(q, ^{
            for (int i=0; i<10; i++) {
                NSLog(@"%d %@",i,[NSThread currentThread]);
            }
        });
        //1.用户登录
        dispatch_sync(q , ^{
            NSLog(@"用户登录  %@",[NSThread currentThread]);
        });
   
        //2.支付
        dispatch_async(q , ^{
            NSLog(@"支付  %@",[NSThread currentThread]);
        });
        
        //3.下载
        dispatch_async(q , ^{
            NSLog(@"下载  %@",[NSThread currentThread]);
        });
        
        
    };
    dispatch_async(q, task);
}

//MARK - 同步任务作用！
/**
 在开发中，通常会将耗时操作放后台执行，有的时候，有些任务彼此有“依赖”关系
 
 例子：登录，支付，下载（网络相关的全部放在子线程中执行）
 
 利用同步任务，能够做到任务依赖关系，前一个任务是同步任务，它不执行完，队列就不会调度后面的任务
 */

-(void)gcdDemo5{
    dispatch_queue_t loginQueue = dispatch_queue_create("WT_queue", DISPATCH_QUEUE_CONCURRENT);
    //1.用户登录
    dispatch_sync(loginQueue, ^{
        NSLog(@"用户登录  %@",[NSThread currentThread]);
    });
    for (int i=0; i<10; i++) {
        NSLog(@"%d",i);
    }
    //2.支付
    dispatch_async(loginQueue, ^{
        NSLog(@"支付  %@",[NSThread currentThread]);
    });
    
    //3.下载
    dispatch_async(loginQueue, ^{
        NSLog(@"下载  %@",[NSThread currentThread]);
    });
    
    NSLog(@"come here");
}

//MARK:- 并发队列,同步步执行
-(void)gcdDemo4{
    /**
     问题：会开几条线程？会顺序执行吗？ come here的位置？
     答案：不会，顺序执行，come here在最后打印
     */
    //1.队列 - 并发  DISPATCH_QUEUE_CONCURRENT
    dispatch_queue_t q = dispatch_queue_create("WT_queue", DISPATCH_QUEUE_CONCURRENT);
    
    //2.同步执行任务
    for (int i=0; i<10; i++) {
        dispatch_sync(q, ^{
            NSLog(@"%@ %d",[NSThread currentThread],i);
        });
    }
    NSLog(@"come here");
}

//MARK:- 并发队列,异步执行
-(void)gcdDemo3{
  /**
   问题：会开几条线程？会顺序执行吗？ come here的位置？
   答案：会开多条线程，不一定会顺序执行，come here在主线程中，与子线程同时开始
   */
    //1.队列 - 并发  DISPATCH_QUEUE_CONCURRENT
    dispatch_queue_t q = dispatch_queue_create("WT_queue", DISPATCH_QUEUE_CONCURRENT);
    
    //2.异步执行任务
    for (int i=0; i<10; i++) {
        dispatch_async(q, ^{
            NSLog(@"%@ %d",[NSThread currentThread],i);
        });
    }
    NSLog(@"come here");
}




@end
