//
//  ViewController.m
//  002-RSA代码
//
//  Created by mac on 2018/5/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"
#import "RSACryptor.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 加载公钥
    [[RSACryptor sharedRSACryptor] loadPublicKey:[[NSBundle mainBundle]pathForResource:@"rsacert.der" ofType:nil]];
    //2.加载私钥 - P12的文件
    [[RSACryptor sharedRSACryptor] loadPrivateKey:[[NSBundle mainBundle]pathForResource:@"p.p12" ofType:nil] password:@"123456"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSData * reault =  [[RSACryptor sharedRSACryptor] encryptData:[@"hello wt 哈哈 呵呵 嘿嘿 嘻嘻" dataUsingEncoding:NSUTF8StringEncoding]];
    //base64编码
    NSString * base64 = [reault base64EncodedStringWithOptions:0];
    NSLog(@"加密的信息：%@",base64);
    
    //解密
    NSData * jiemi = [[RSACryptor sharedRSACryptor] decryptData:reault];
    NSString * jiemiBase64 = [[NSString alloc]initWithData:jiemi encoding:NSUTF8StringEncoding];
    NSLog(@"解密的信息：%@",jiemiBase64);
}


@end
