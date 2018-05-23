//
//  ViewController.m
//  002-NSURLSession下载
//
//  Created by mac on 2018/5/21.
//  Copyright © 2018年 mac. All rights reserved.


#import "ViewController.h"
#import "WTProgressBtn.h"

@interface ViewController ()<NSURLSessionDownloadDelegate>

/** 全局的网络会话（Session），管理所有的网络任务  **/
@property(nonatomic,strong)NSURLSession * session;
@property (weak, nonatomic) IBOutlet WTProgressBtn *progressView;
@end

@implementation ViewController

-(NSURLSession *)session{
    if (!_session) {
        //config 提供了一个全局的网络环境配置，包括：身份验证，浏览器类型，cookie，缓存，超时...
        NSURLSessionConfiguration * config =[NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
    }
    return _session;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSURL * url = [NSURL URLWithString:@"http://127.0.0.1/abc.wmv"];
    NSLog(@"开始");
    //如果需要下载进度，NSURLSession和NSURLConnection一样，都是使用代理
    //NSURLSession的单例是全局的，是整个系统的，那么我们设置代理，不能用全局的进行设置
    /*
     如果要跟进下载进度，不能使用block回调的方式，否则不走代理
     */
//    [[self.session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSLog(@"%@",location);
//
//    }]resume];
    [[self.session downloadTaskWithURL:url] resume];
}

#pragma mark - <NSURLSessionDownloadDelegate>
/*
 iOS7.0，以下三个方法都是必须要实现的，到了iOS8.0只剩下下载完成是必须的
 */
/*1.下载完成方法*/
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    NSLog(@"完成 %@",location);
}
//2.下载进度
/**
 1.session
 2.downloadTask  调用代理方法的下载任务
 3.bytesWritten  本次下载的字节数
 4.bytesWritten  已经下载的字节数
 5.totalBytesExpectedToWrite 期望下载的字节数 -> 文件总大小
 */
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    float progress = (float)totalBytesWritten / totalBytesExpectedToWrite ;
    //回到主线程
    dispatch_async(dispatch_get_main_queue(), ^{
        self.progressView.progress = progress;
    });
    
    NSLog(@"%f %@",progress,[NSThread currentThread]);
}
//3.下载续传数据
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes{
    
}
@end
