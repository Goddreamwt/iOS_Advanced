//
//  MainViewController.m
//  recreation
//
//  Created by mac on 2019/2/28.
//  Copyright © 2019年 WT. All rights reserved.
//

#import "MainViewController.h"
#import "WTNavigationViewController.h"
#import "HomeViewController.h"
#import "FollowViewController.h"
#import "UserCenterViewController.h"
#import "DiscoveryViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //-----1.0版本更新-基本项目搭建-tab页-----
    NSArray * titlesArr = @[@"首页",@"发现",@"关注",@"我的"];
    NSArray * imagesArr = @[@"tabbar_home",@"tabbar_discovery",@"tabbar_follow",@"tabbar_usercenter"];
    
    //创建对应的控制器加入TabBarController的数组中
    self.viewControllers = @[
                             [[WTNavigationViewController alloc]initWithRootViewController:[HomeViewController new]],
                             [[WTNavigationViewController alloc]initWithRootViewController:[DiscoveryViewController new]],
                             [[WTNavigationViewController alloc] initWithRootViewController:[FollowViewController new]],
                             [[WTNavigationViewController alloc] initWithRootViewController:[UserCenterViewController new]]
                             ];
    
    //遍历将文字和图片放入tabBar的Item中
    for (int i = 0; i < self.viewControllers.count; ++i) {
        UIViewController *vc = self.viewControllers[i];
        vc.tabBarItem.title = titlesArr[i];
        vc.tabBarItem.image = [UIImage imageNamed:imagesArr[i]];
    }
}


@end
