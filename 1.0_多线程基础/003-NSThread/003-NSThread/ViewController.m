//
//  ViewController.m
//  003-NSThread
//
//  Created by mac on 2018/4/27.
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
    [self threadDemo3];
}

-(void)threadDemo3{
    //number=1
    NSLog(@"A---%@",[NSThread currentThread]);
    //InBackground 就是在后台（子线程）运行！！
    //是NSObject的分类，意味着所有的继承NSObject的都可以使用这个方法
    //非常方便，不用NSThread对象
    [self performSelectorInBackground:@selector(demo:) withObject:@"background"];
    //number=1
    NSLog(@"B---%@",[NSThread currentThread]);
}

-(void)threadDemo2{
    //number=1
    NSLog(@"A---%@",[NSThread currentThread]);
    //detach => 分离(立刻启动子线程)
    [NSThread detachNewThreadSelector:@selector(demo:) toTarget:self withObject:@"Detach"];
    //number=1
    NSLog(@"B---%@",[NSThread currentThread]);
}

-(void)threadDemo1{
    NSLog(@"A--------------");
    //创建一个NSThread
    NSThread * thread =[[NSThread alloc]initWithTarget:self selector:@selector(demo:) object:@"Thread"];
    //启动线程
    [thread start];
    for (int i=0; i<10; i++) {
        NSLog(@"%d",i);
    }
    NSLog(@"B--------------");
}
-(void)demo:(id)obj{
    for (int i=0; i<2; i++) {
        //number !=1
      NSLog(@"C--------------%@",[NSThread currentThread]);
    }
}
@end
