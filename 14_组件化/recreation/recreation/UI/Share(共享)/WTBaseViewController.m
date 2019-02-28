//
//  WTBaseViewController.m
//  recreation
//
//  Created by mac on 2019/2/28.
//  Copyright © 2019年 WT. All rights reserved.
//

#import "WTBaseViewController.h"

@interface WTBaseViewController ()

@end

@implementation WTBaseViewController

//------1.0版本更新：基本搭建tab页-----
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    //测试
    UIButton * action = [UIButton buttonWithType:UIButtonTypeCustom];
    [action setFrame:CGRectMake(100, 100, 100, 50)];
    [action setTitle:@"action" forState:UIControlStateNormal];
    [action addTarget:self action:@selector(jumpAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:action];
}

-(void)jumpAction:(id)sender{
    WTBaseViewController * vc = [[WTBaseViewController alloc]init];
    //隐藏跳转页面tabbar底部
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
