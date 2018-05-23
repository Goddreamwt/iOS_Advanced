//
//  ViewController.m
//  001-NSOperation
//
//  Created by mac on 2018/5/8.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/**
 全局队列
 */
@property(nonatomic,strong)NSOperationQueue * opQueue;

@end

@implementation ViewController

/**
 NSOperation 苹果大力推荐的“并发”技术，也是不需要开发者关注线程的生命周期的
 
 NSOperation 的核心概念：将“操作” 添加到 “队列”中
 GCD 将“任务”添加到“队列”中
 
 NSOperation 类 是一个抽象类
 特点：
 -不能直接使用的类
 目的：
 -定义子类共有的属性和方法
 子类
 -NSInvocationOperation
 -NSBlookOperation
 
 GCD & NSoperation 对比
 GCD 在iOS4.0推出，主要针对多核处理器做了优化的并发技术，是C语言的
  -将“任务”【block】添加到队列[串行，并发，主队列，全局队列]，并且指定任务的函数[同步，异步]
  -线程间的通讯 dispatch_get_main_queue()
  -提供了一些 NSOperation 不具备的功能
    - 一次执行
    - 延时执行
    - 调度组(在op中也可以做到，有点麻烦)
 
 NSOperation 在iOS2.0推出，是对GCD的封装，苹果推出GCD以后，对NSOperation 底层做了重写
  -将操作[异步执行的任务] 添加到队列[并发队列]，就会立刻异步执行
  -mainQueue
  -提供了一些GCD实现起来比较困难的功能
     - 最大并发线程
     - 队列的暂停/继续
     - 取消所有的操作
     - 指定操作之间的依赖关系（GCD用同步实现）
 */
//懒加载
-(NSOperationQueue *)opQueue{
    if(!_opQueue){
        _opQueue =[[NSOperationQueue alloc]init];
    }
    return _opQueue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self demo6];
}


//MARK:线程间通讯
-(void)demo6{
    [self.opQueue addOperationWithBlock:^{
        NSLog(@"耗时操作 %@",[NSThread currentThread]);
        //主线程更新UI
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
            NSLog(@"UIUIUIUI %@",[NSThread currentThread]);
        }];
    }];
    

}


//MARK:全局队列 - 只要是NSOperation 的子类，都可以添加到队列中
-(void)demo5{
    //直接添加任务
    for (int i=0; i<10; i++) {
        [self.opQueue addOperationWithBlock:^{
            NSLog(@"%@--%d",[NSThread currentThread],i);
        }];
    }
    
    //block operation
    NSBlockOperation * op1 =[NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"BLOCK %@--%d",[NSThread currentThread],100);
    }];
    [self.opQueue addOperation:op1];
    
    //invocation opreation
    NSInvocationOperation * op2 =[[NSInvocationOperation alloc]initWithTarget:self selector:@selector(downLoadImage:) object:@"invocation"];
    
    [self.opQueue addOperation:op2];
}

//MARK:更简单
-(void)demo4{
    //1.队列 -> 队列如果每次分配会比较浪费
    //在实际开发中，会使用全局队列
    NSOperationQueue * q =[[NSOperationQueue alloc]init];
    
    //2.操作
    for (int i=0; i<10; i++) {
        [q addOperationWithBlock:^{
            NSLog(@"%@--%d",[NSThread currentThread],i);
        }];
    }
}

//MARK: NSBlookOperation 所有代码都写在一起，便于维护
-(void)demo3{
    //1.队列
    NSOperationQueue * q =[[NSOperationQueue alloc]init];
    
    //2.操作
    for (int i=0; i<10; i++) {
        NSBlockOperation * op =[NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"%@--%d",[NSThread currentThread],i);
        }];
        //添加到队列
        [q addOperation:op];
    }
}

//MARK:NSInvocationOperation 演练

/**  开启多个线程  不会顺序执行 --> GCD并发队列，异步执行
 NSOperation 本质上是对GCD的面向对象的封装！
 -队列：本质上 就是GCD的并发队列
 -操作：异步执行任务
 */
-(void)demo2{
    //1.队列
    NSOperationQueue * q =[[NSOperationQueue alloc]init];
    
    for (int i=0; i<10; i++) {
        NSInvocationOperation * op =[[NSInvocationOperation alloc]initWithTarget:self selector:@selector(downLoadImage:) object:@(i)];
        //添加到队列
        [q addOperation:op];
    }
}

-(void)demo1{
    //定义操作
    NSInvocationOperation * op =[[NSInvocationOperation alloc]initWithTarget:self selector:@selector(downLoadImage:) object:@"invocation"];
    //start 方法，会在当前线程执行调度方法
//    [op start];
    
    //队列
    NSOperationQueue * q =[[NSOperationQueue alloc]init];
    
    //将操作添加到队列 - 会自动异步执行调度方法
    [q addOperation:op];
    
}

-(void)downLoadImage:(id)objc{
    NSLog(@"%@ %@",[NSThread currentThread],objc);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
