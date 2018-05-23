//
//  ViewController.m
//  002-NSURLRequest
//
//  Created by mac on 2018/5/10.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //0.NSData 方法  在实际开发中用不到
    /*
       因为：
       - 默认超时时长 60s，没有办法修改，且没有缓存策略
       - dataWithContentsOfURL 是同步方法
       - 没有错误处理机制
     */
//    NSData * data =[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://127.0.0.1/demo.json"]];
//
//    NSString * json = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//    NSLog(@"%@",json);
    
    //1.NSURLRequest 方法
    NSURL * url = [NSURL URLWithString:@"http://127.0.0.1/demo.json"];
    /*
     timeoutInterval:超时时长
       一般在实际开发中建议：15到30秒，太短了可能服务器来不及做出响应，太长了用户等待太久，影响用户体验
       -SDWebImage 默认时长 15s
       -AFNetworking 默认时长 60s
     
     cachePolicy:缓存策略
     NSURLRequestUseProtocolCachePolicy = 0,  默认缓存策略
     NSURLRequestReload(刷新)Ignoring(忽略)Local(本地)Cache(缓存)Data = 1, 忽略本地缓存数据，直接加载网络数据，每次都是“最新数据”
         应用场景：数据变化非常频繁的App  股票，彩票
     
       **** 提示：以下两个选项，专门用于离线浏览的，建议结合 Reachalibity 框架联合使用
       - 如果用户当前没有网络，就使用默认缓存策略
       - 如果有网络就用默认缓存策略
     NSURLRequestReturnCacheDataElseLoad = 2,  返回缓存数据，如果没有缓存从服务器加载
     NSURLRequestReturnCacheDataDontLoad = 3,  返回缓存数据，如果没有缓存就空着

     */
    NSURLRequest * request =[NSURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:15.0];
    //异步发送，错误处理机制
    /*
      1.request - 索要资源的请求
      2.queue - 调度任务的队列
        指定调度回调代码块的队列
        - 主队列，回调的代码块在主线程上执行
        - 新建队列，就会在其他线程执行回调代码
        如何选择？是否需要更新UI
     
      3.block - 回调代码块，网络请求结束后执行
        3.1 response(NSHTTPURLResponse):服务器响应
            URL      服务器返回的URL，绝大部分和请求的URL是一样的，“请求重定向”的时候不一样
            MIMEType 二进制数据的文件类型，服务器会告诉客户端，可以使用什么软件打开二进制数据
            expectedContentLength  下载文件的长度
            textEncodingName       文本编码名称，大多是UTF8
            suggestedFilename      服务器建议保存的文件名称
            statusCode             状态码 2XX 3XX（重定向） 4XX（客户端问题） 5XX服务器问题
            allHeaderFields        所有响应头的内容
     
        3.2 data:数据实体，程序员开发最关注的
        3.3 connectionError:错误处理
            注意：实际开发中有一种情况是没有错误，也没有数据
             if(connectionError || data == nil){
                NSLog("您的网络不给力，请稍后再试！");
             }
     */
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSLog(@"%@",response);
        
        NSString * json = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",json);
    }];
    NSLog(@"come here");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
