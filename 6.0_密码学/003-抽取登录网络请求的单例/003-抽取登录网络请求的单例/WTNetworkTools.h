//
//  WTNetworkTools.h
//  003-抽取登录网络请求的单例
//
//  Created by mac on 2018/5/16.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

//登录成功通知
#define WTLoginSuccessNotifation @"WTLoginSuccessNotifation"

@interface WTNetworkTools : NSObject
/** 账户 **/
@property(nonatomic,copy)NSString * username;
/** 密码 **/
@property(nonatomic,copy)NSString * password;

/**用户登录*/
-(void)login;

//单例
+(instancetype)shareNetworkTools;

@end
