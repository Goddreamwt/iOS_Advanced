//
//  ViewController.m
//  001--NSURLConnection
//
//  Created by H on 2017/2/17.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/*
问题: 
 1.没有下载进度 ,会影响用户体验
 2.内存偏高,有一个最大峰值:
 */

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //1.url
    NSString * urlStr = @"http://127.0.0.1/002--加密算法介绍.wmv";
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL * url = [NSURL URLWithString:urlStr];
    
    
    //2.request
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    //3.connection
    NSLog(@"开始");
    /*
     NSURLConnection - 从 iOS 2.0 开始
     异步加载  iOS 5.0 才有的, 在 5.0 以前,是通过代理来实现网络开发!!
     
     - 开发简单的网络网络请求还是比较方便的,直接用异步方法!!
     - 开发复杂的网络请求,步骤非常繁琐!!
     
     */
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
       //将数据写入磁盘  data首先是在内存里面!!然后一次性写入到磁盘!
        [data writeToFile:@"/Users/h/Desktop/123/123.wmv" atomically:YES];
        
        NSLog(@"完成");
    }];
}


@end
