//
//  ViewController.m
//  003-NSLog技巧
//
//  Created by mac on 2018/5/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+Log.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray * arr = @[@"张三",@"WT"];
    NSLog(@"%@",arr);
    for (id obj in arr) {
        NSLog(@"%@",obj);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
