//
//  AppDelegate.m
//  003-抽取登录网络请求的单例
//
//  Created by mac on 2018/5/16.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "AppDelegate.h"
#import "WTNetworkTools.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSuccess) name:WTLoginSuccessNotifation object:nil];
    //直接登录
    [[WTNetworkTools shareNetworkTools] login];
    return YES;
}

//接收到登录成功的方法
-(void)loginSuccess{
    UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.window.rootViewController = sb.instantiateInitialViewController;
}

@end
