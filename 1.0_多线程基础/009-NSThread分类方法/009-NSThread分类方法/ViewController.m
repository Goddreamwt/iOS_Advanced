//
//  ViewController.m
//  009-NSThread分类方法
//
//  Created by mac on 2018/5/3.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //用alloc init 适用于自定义NSThread（子类）
//    NSThread * t =[[NSThread alloc]init];
//    [t start];
//    [self performSelector:@selector(otherMethod) onThread:t withObject:nil waitUntilDone:NO];
    
    NSThread * t =[[NSThread alloc]initWithTarget:self selector:@selector(demo) object:nil];
    [t start];
    //不执行地方原因，是因为 demo 方法执行的快
    [self performSelector:@selector(otherMethod) onThread:t withObject:nil waitUntilDone:NO];
}

-(void)demo{
    NSLog(@"%@",[NSThread currentThread]);
    [[NSRunLoop currentRunLoop]run];
}

-(void)otherMethod{
    NSLog(@"%s %@",__FUNCTION__,[NSThread currentThread]);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}


@end
