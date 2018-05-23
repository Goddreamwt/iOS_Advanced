//
//  ViewController.m
//  005-NSThread属性
//
//  Created by mac on 2018/5/2.
//  Copyright © 2018年 mac. All rights reserved.
//并发编程！！ Pthread NSThread GCD NSOpration 并发技术

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSThread的基础属性
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self threadDemo];

}

-(void)threadDemo{
    NSThread * t =[[NSThread alloc]initWithTarget:self selector:@selector(demo) object:nil];
    //name属性 在大型的商业项目中，通常希望程序在崩溃的时候，能够获取到程序准确的所在的线程！
    t.name =@"Thread A";
    //优先级 从 0.0 到 1.0 默认值0.5
    /*
     优先级只是保证CPU调度的可能性更高
     
     多线程目的：将耗时操作放在后台，不阻塞UI线程
     建议：在开发的时候，不要修改优先级
     
     在多线程开发中，不要相信一次的运行结果！！
     */
    t.threadPriority = 0.1;
    [t start];
    
    NSThread * t1 =[[NSThread alloc]initWithTarget:self selector:@selector(demo) object:nil];
    //name属性 在大型的商业项目中，通常希望程序在崩溃的时候，能够获取到程序准确的所在的线程！
    t1.name =@"Thread B";
    t1.threadPriority = 1.0;
    [t1 start];
}

-(void)demo{
    for (int i=0; i<20; i++) {
        NSLog(@"%@ %d",[NSThread currentThread],i);
    }
    //isMainThread属性 判断当前线程是不是主线程
//    if(![NSThread isMainThread]){
//        //模拟崩溃
//        NSMutableArray * arr =[NSMutableArray array];
//        [arr addObject:nil];
//    }
    
}
@end
