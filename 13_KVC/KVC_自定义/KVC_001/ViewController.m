//
//  ViewController.m
//  KVC_001
//
//  Created by mac on 2018/12/7.
//  Copyright © 2018年 WT. All rights reserved.
//

#import "ViewController.h"
#import "WTPerson.h"
#import "NSObject+KVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WTPerson * p =[WTPerson new];
    [p wt_setValue:@"wt" forKey:@"name"];
    
    NSLog(@"name-KVC = %@",[p wt_valueForKey:@"name"]);
    NSLog(@"_name = %@",p->_name);
    NSLog(@"_isName = %@",p->_isName);
    NSLog(@"name = %@",p->name);
    NSLog(@"isName = %@",p->isName);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
