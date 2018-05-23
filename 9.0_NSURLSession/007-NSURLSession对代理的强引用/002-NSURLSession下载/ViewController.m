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
/** 全局的下载任务  **/
@property(nonatomic,strong)NSURLSessionDownloadTask * downloadTask;
/** 续传的数据  **/
@property(nonatomic,strong)NSData * reumeData;

@end

@implementation ViewController

-(NSURLSession *)session{
    if (!_session) {
        //config 提供了一个全局的网络环境配置，包括：身份验证，浏览器类型，cookie，缓存，超时...
        NSURLSessionConfiguration * config =[NSURLSessionConfiguration defaultSessionConfiguration];
        /*
         队列：设置回调的代理方法在哪里执行
          - 代理的队列 如果给nil 那么队列将在多个线程中执行
          - 如果设置为[NSOperationQueue mainQueue] 那么将在主线程中执行
         */
        /*
         session会对代理进行强引用，如果任务执行结束后，不取消session，会出现内存泄露
         
         真正的网络访问
         -在网络开发中，应该将所有的网络访问操作，封装到一个方法中，由一个统一的单例对象来负责所有的网络事件监听。
         -session对代理（单例）进行强引用，单例本身就是一个静态的实例，本身就不需要释放
         -AFN -> 需要建立一个AFN Manager
         
         */
        _session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
    }
    return _session;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //取消会话
    [self.session invalidateAndCancel];
    self.session = nil;
}

-(void)dealloc{
    NSLog(@"我走了");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)start {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSURL * url = [NSURL URLWithString:@"http://127.0.0.1/abc.wmv"];
        NSLog(@"开始");
        self.downloadTask = [self.session downloadTaskWithURL:url];
        [self.downloadTask resume];
        NSLog(@"%@",[NSThread currentThread]);
    });
    
}
//暂停
- (IBAction)pause:(id)sender {
    NSLog(@"暂停");
    [self.downloadTask cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
        //resumeData 续传的数据（下载了多少）
        self.reumeData  =resumeData;
        //释放下载任务
        // - 让我们task设置为week，就可以不用释放了
        //因为任务都是由session发起的，而session对发起的任务都会持有一个强引用，但是不建议这样做
        self.downloadTask = nil;
    }];
}

//继续
- (IBAction)resume:(id)sender {
    if (self.reumeData == nil) {
        NSLog(@"无暂停任务");
        return;
    }
    //所有的任务都是由session发起的
   
    //使用续传数据启动下载任务
    self.downloadTask =  [self.session downloadTaskWithResumeData:self.reumeData];
    //清空续传数据
    self.reumeData = nil;
    //所有的任务都是默认挂起的
    [self.downloadTask resume];
}

#pragma mark - <NSURLSessionDownloadDelegate>
/*
 iOS7.0，以下三个方法都是必须要实现的，到了iOS8.0只剩下下载完成是必须的
 */
/*1.下载完成方法*/
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    NSLog(@"完成 %@",location);
    //完成任务
    [self.session finishTasksAndInvalidate];
    //清空session
    self.session = nil;
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
