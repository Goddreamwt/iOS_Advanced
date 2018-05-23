//
//  ViewController.m
//  001—耗时操作
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
    //[NSThread currentThread]判断是否是在主线程
    //number ==1 说明是主线程 !=1就是其他线程
    for (int i=0; i<50000; i++) {
        NSLog(@"%d%@",i,[NSThread currentThread]);
    }
}


@end
