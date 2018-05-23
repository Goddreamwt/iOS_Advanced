//
//  ViewController.m
//  001-NSURLSession
//
//  Created by mac on 2018/5/21.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //1.url
    NSURL * url = [NSURL URLWithString:@"http://127.0.0.1/videos.json"];

    //建立指定URL的数据任务
    [self taskWithURL:url];
}

-(void)taskWithURL:(NSURL *)url{
    //3.NSURLSessionDataTask -> 在NSRULSession 开发中，所有的任务都是由Session发起的
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //反序列化
        id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@",result);
    } ] resume];
}

-(void)session1{
    //1.url
    NSURL * url = [NSURL URLWithString:@"http://127.0.0.1/videos.json"];
    //2.session -> 苹果提供了全局的单例，简化我们的开发
    NSURLSession * session = [NSURLSession sharedSession];
    
    //3.NSURLSessionDataTask -> 在NSRULSession 开发中，所有的任务都是由Session发起的
    NSURLSessionDataTask * task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //反序列化
        id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@",result);
    } ];
    
    //4.启动任务
    [task resume];
}
@end
