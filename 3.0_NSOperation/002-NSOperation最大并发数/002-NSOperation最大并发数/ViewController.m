//
//  ViewController.m
//  002-NSOperation最大并发数
//
//  Created by mac on 2018/5/9.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/**全局队列*/
@property(nonatomic,strong)NSOperationQueue * opQueue;

@end

@implementation ViewController

//懒加载
-(NSOperationQueue *)opQueue{
    if(!_opQueue){
        _opQueue =[[NSOperationQueue alloc]init];
    }
    return _opQueue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dependecy];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self demo1];
}
//MARK:依赖关系
-(void)dependecy{
    
/**
 例子：下载，解压，通知用户
 */
    //1.下载
    NSBlockOperation * op1 =[NSBlockOperation blockOperationWithBlock:^{
        [NSThread sleepForTimeInterval:0.5];
        NSLog(@"下载---%@",[NSThread currentThread]);
    }];
    //2.解压
    NSBlockOperation * op2 =[NSBlockOperation blockOperationWithBlock:^{
          [NSThread sleepForTimeInterval:1.0];
        NSLog(@"解压---%@",[NSThread currentThread]);
    }];
    //3.通知用户
    NSBlockOperation * op3 =[NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"通知用户---%@",[NSThread currentThread]);
    }];
    //NSOperation 提供了依赖关系
    [op2 addDependency:op1];
    [op3 addDependency:op2];
//    [op1 addDependency:op3];//注意，不要指定循环依赖，队列就不工作了
    
    //添加到队列中  waitUntilFinished:是否等待  会卡主当前线程
    [self.opQueue addOperations:@[op1,op2] waitUntilFinished:YES];
    
    //主线程通知用户
    [[NSOperationQueue mainQueue] addOperation:op3];
    NSLog(@"come here %@",[NSThread currentThread]);
}

//MARK:取消所有操作

/**
 1.队列挂起的时候，不会清空内部的操作，只有在队列继续的时候才会清空
 2.正在执行的操作，也不会被取消
 */
-(IBAction)cancelAll{
    NSLog(@"取消所有操作");
    //取消操作
    [self.opQueue cancelAllOperations];
    
    NSLog(@"取消之后的操作数是 %tu",self.opQueue.operationCount);
}


//MARK: 暂停&继续

/**
 当我们挂起队列的时候，正在执行的操作（正在线程上执行的任务）不受影响!
 suspended：决定队列的暂停和继续
 operationCount:队列中的操作数
 */
-(IBAction)pause{
    //判断我们的队列是否挂起！
    if (self.opQueue.isSuspended) {
        NSLog(@"继续 %tu",self.opQueue.operationCount);
        self.opQueue.suspended = NO;
        NSLog(@"继续之后的操作数是 %tu",self.opQueue.operationCount);
    }else{
        NSLog(@"暂停 %tu",self.opQueue.operationCount);
        self.opQueue.suspended = YES;
    }
}

//MARK:最大并发数
-(void)demo1{
    //设置同时最大的并发操作数量
    //WIFI:5至6条
    //流量：2至3条
    self.opQueue.maxConcurrentOperationCount = 2;
    
    //添加操作进队列
    /*
     从iOS8.0开始，无论使用GCD还是NSOperation，都会开启很多线程
     在iOS7.0以前，GCD通常只会开启5，6条线程
     目前线程多了说明：
       1.底层的线程池更大了，能够拿到的线程资源多了！
       2.对控制同时并发的线程数，要求就更高了！
     */
    for (int i=0; i< 20; i++) {
        [self.opQueue addOperationWithBlock:^{
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"%@-----%d",[NSThread currentThread],i);
        }];
    }
}

@end
