//
//  NetworkLayer.m
//  NetworkLayer
//
//  Created by mac on 2018/12/13.
//  Copyright © 2018年 WT. All rights reserved.
//

#import "NetworkLayer.h"
#import "AFNetworking.h"

@implementation NetworkLayer

- (void) get:(NSString *)username password:(NSString *)password{
    NSLog(@"发起get请求");
}

- (void) post:(NSString *)username password:(NSString *)password{
    NSLog(@"发起post请求");
}

@end
