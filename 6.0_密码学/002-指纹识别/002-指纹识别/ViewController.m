//
//  ViewController.m
//  002-指纹识别
//
//  Created by mac on 2018/5/16.
//  Copyright © 2018年 mac. All rights reserved.
//  登录的逻辑 是否可以用指纹来代替呢？
/*
 指纹和密码的区别
 指纹：代表你是这个手机的主人
 密码：代表你是这个账号的主人
 
 支付是先做了登录的，登录是用到密码的，两者结合使用才是正确的，指纹不能取代密码
 */

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //指纹识别
    [self laContext];
}


/**指纹识别的错误信息
 LAErrorAuthenticationFailed ---指纹无法识别
 LAErrorUserCancel           ---用户点击取消
 LAErrorUserFallback         ---用户点击了输入密码
 LAErrorSystemCancel         ---系统取消，比如激活了其他应用
 LAErrorPasscodeNotSet       ---因为设备上没有设置密码
 LAErrorTouchIDNotAvailable  ---设备没有Touch ID，iPhone5s以前的设备
 LAErrorTouchIDNotEnrolled   ---因为用户没有输入指纹
 LAErrorTouchIDLockout       ---多次输入错误，密码锁定
 LAErrorBiometryNotAvailable ---指纹信息不可用
 LAErrorBiometryNotEnrolled  ---指纹信息没注册
 LAErrorBiometryLockout      ---指纹锁定
 LAErrorNotInteractive       ---无交互
 */
-(void)laContext{
    LAContext * ctx = [[LAContext alloc]init];
    //判断设备是否支持指纹识别
    if ([ctx canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:NULL]) {
        //输入指纹
        [ctx evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"指纹支付" reply:^(BOOL success, NSError * _Nullable error) {
            NSLog(@"%d %@",success,error);
        }];
    }else{
        NSLog(@"不支持");
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
