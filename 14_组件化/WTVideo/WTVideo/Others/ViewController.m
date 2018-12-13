//
//  ViewController.m
//  WTVideo
//
//  Created by mac on 2018/12/13.
//  Copyright © 2018年 WT. All rights reserved.
//

#import "ViewController.h"
#import "BusinessLayer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BusinessLayer * layer =[BusinessLayer new];
    [layer login:@"wt" password:@"888888888"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
