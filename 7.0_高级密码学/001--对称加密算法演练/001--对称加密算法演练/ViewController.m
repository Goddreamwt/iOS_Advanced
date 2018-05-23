//
//  ViewController.m
//  001--对称加密算法演练
//
//  Created by H on 2017/2/15.
//  Copyright © 2017年 TZ. All rights reserved.
//  哈希:不可逆!  --  验证!信息摘要
//

#import "ViewController.h"
#import "EncryptionTools.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //AES - ECB 加密
    NSString * key = @"wt";
    
    NSString * pwd = [[EncryptionTools sharedEncryptionTools] encryptString:@"hello" keyString:key iv:nil];
    NSLog(@"加密: %@",pwd);
    //解密
    NSLog(@"解密: %@",[[EncryptionTools sharedEncryptionTools] decryptString:pwd keyString:key iv:nil]);
    

    //AES - CBC 加密
    uint8_t iv[8] = {2,3,4,5,6,7,0,0}; //直接影响加密结果!
    NSData * ivData = [NSData dataWithBytes:iv length:sizeof(iv)];
    
    NSString * pwd2 =[[EncryptionTools sharedEncryptionTools] encryptString:@"hello" keyString:key iv:ivData];
    NSLog(@"CBC加密: %@",pwd2);
    
    NSLog(@"CBC解密: %@", [[EncryptionTools sharedEncryptionTools] decryptString:pwd2 keyString:key iv:ivData]);
    
    //DES - ECB 加密
    [EncryptionTools sharedEncryptionTools].algorithm = kCCAlgorithmDES;
    NSString * pwd3 = [[EncryptionTools sharedEncryptionTools] encryptString:@"hello" keyString:key iv:nil];
    NSLog(@"DES 加密%@",pwd3);
    NSLog(@"DES 解密: %@", [[EncryptionTools sharedEncryptionTools] decryptString:pwd3 keyString:key iv:nil]);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
