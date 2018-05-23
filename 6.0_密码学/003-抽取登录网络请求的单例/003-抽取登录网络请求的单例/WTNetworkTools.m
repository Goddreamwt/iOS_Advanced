//
//  WTNetworkTools.m
//  003-抽取登录网络请求的单例
//
//  Created by mac on 2018/5/16.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "WTNetworkTools.h"
#import "NSString+Hash.h"
#import "SSKeychain.h"


#define WTLoginServiceName @"WTLoginServiceName"

@implementation WTNetworkTools

+(instancetype)shareNetworkTools{
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
        //加载本地账户密码
        [instance loadUserInfo];
    });
    return instance;
}

//加载本地用户信息
-(void)loadUserInfo{
    //加载账号
    self.username = [[NSUserDefaults standardUserDefaults] stringForKey:@"WTLoginServiceName"];
    //找出所有的账号
    self.password = [SSKeychain passwordForService:WTLoginServiceName account:self.username];
}

//获取授权信息 -- 等待设备授权!!
-(NSString *)getKeyWithAccunt:(NSString *)accunt{
    //1.需要授权
    //2.直接返回密钥
    return @"WTKey";
}

//实现登录代码
-(void)login{
    //发请求给服务器 -- 验证
    NSString * user = self.username;
    //密码 明文的!!
    NSString * pwd = self.password;
    // 1. ------------- MD5 加密 --------------
    //    pwd = pwd.md5String;
    // 2. ------------- MD5 加盐 --------------
    //不足:盐是固定的!有人知道!!
    //    pwd = [pwd stringByAppendingString:salt].md5String;
    // 3. ------------- HMAC --------------
    // 在实际开发中,密钥来自于服务器!! 注册的时候!!
    NSString * key = nil;//通过钥匙串访问来获取这个key
    if (key == nil) {
        //1.发送网络请求!获取密钥!!
        //2.展示"小菊花!!!"
        key = [self getKeyWithAccunt:user];
        //展示等待授权页面!!
        
        //立刻马上保存这个KEY在本地!! -- 通过钥匙串访问!
        
    }
    pwd = [pwd hmacMD5StringWithKey:key];
    
    NSLog(@"现在的密码是:%@",pwd);
    
    //模拟网络请求!!
    if( [self isLoginWithUserId:user PassWord:pwd]){
        //保存账号密码 明文账号--密码
        [self savePwdWithAccunt:self.username Pwd:self.password];
        NSLog(@"登录成功");
    }else{
        NSLog(@"登录失败");
    }
}

//模拟网络请求 :既然是网络请求..结果返回肯定是异步的!
- (BOOL)isLoginWithUserId:(NSString *)userid PassWord:(NSString *)passw{
    if ([userid isEqualToString:@"WTKey"] && [passw isEqualToString:@"e9cdab82d48dcd37af7734b6617357e6"]) {
        //发布通知
        [[NSNotificationCenter defaultCenter]postNotificationName:WTLoginSuccessNotifation object:nil];
        
        return YES;
    }else{
        //发布登录失败的通知
//        [[NSNotificationCenter defaultCenter]postNotificationName:HKLoginFailedNotifcation object:nil];
        return NO;
    }
    
}

//保存账号密码
-(void)savePwdWithAccunt:(NSString *)accunt Pwd:(NSString *)pwd{
    //保存账号
    [[NSUserDefaults standardUserDefaults] setObject:self.username forKey:@"WTLoginUserName"];
    //同步 -- 立刻马上保存!
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    //保存密码
    if (accunt.length > 0 && pwd.length> 0) {
        /**
         *  参数
         *  1. 密码明文
         *  2. 服务,可以随便写,但是他是APP的一个标识,建议用BundleID
         *  3. 账号,用户名
         */
        [SSKeychain setPassword:pwd forService:WTLoginServiceName account:accunt];
    }
}
@end
