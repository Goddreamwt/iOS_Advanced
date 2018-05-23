//
//  ViewController.m
//  001-网络请求
//
//  Created by mac on 2018/5/9.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.url
    NSURL * url =[NSURL URLWithString:@"https://m.baidu.com"];
    //2.request 建立请求，告诉服务器想要的资源，以及附加信息
    NSMutableURLRequest * request =[NSMutableURLRequest requestWithURL:url];
    //告诉服务器一些附加信息
    //User-Agent 告诉服务器客户端的类型：iPhone
    //forHTTPHeaderField 所有访问服务器前，要额外告诉服务器的附加信息，都是通过这个字段来设置的
    [request setValue:@"iPhone AppleWebKit" forHTTPHeaderField:@"User-Agent"];
    //3.链接服务器
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSString * html = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];

        //让webView显示html
        [self.webView loadHTMLString:html baseURL:nil];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
