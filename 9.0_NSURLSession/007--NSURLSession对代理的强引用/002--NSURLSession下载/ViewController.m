//
//  ViewController.m
//  002--NSURLSession下载
//
//  Created by H on 2017/2/20.
//  Copyright © 2017年 TZ. All rights reserved.
//  静态库  - 每一个应用程序都会有一个副本
//  动态库,在系统中只有一个副本,只有苹果公司能够建立动态库!! 当然!开发者也可以开发动态库,但是不允许上架!

#import "ViewController.h"
#import "HKProgressBtn.h"

@interface ViewController ()<NSURLSessionDownloadDelegate>
/** 全局的网络会话(Session),管理所有的网络任务  */
@property(nonatomic,strong)NSURLSession * session;
@property (weak, nonatomic) IBOutlet HKProgressBtn *progressView;

/** 续传的数据  */
@property(nonatomic,strong)NSData * resumeData;


/** 全局的下载任务  */
@property(nonatomic,strong)NSURLSessionDownloadTask * downloadTask;

@end

@implementation ViewController


-(NSURLSession *)session
{
    if (_session == nil) {
        //config 提供了一个全局的网络环境配置,包括:身份验证,浏览器类型,cookie,缓存,超时...
        NSURLSessionConfiguration * config = [NSURLSessionConfiguration defaultSessionConfiguration];
        /*
         队列: 设置回调的代理方法在哪里执行!!
            - 代理的队列 如果给 nil 哥么在 多个线程执行
            - [NSOperationQueue mainQueue] 主队列
         */
        /*
         The session object keeps a strong reference to the delegate
         Session 会对代理进行强引用!!如果任务执行结束后,不取消session,会出现内存泄露!!
         
         
         真正的网络访问!
         - 在网络开发中,应该讲所有的网络访问操作,封装到一个方法中,由一个统一的单例对象来负责素有的网络事件!
         - Session对代理(单例)进行强引用!单例本身就是一个静态的实例,本身就不需要释放!!
         - AFN -> 需要建立一个AFN 的Manager
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


-(void)dealloc
{
    NSLog(@"我走了");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)start {
    NSURL * url = [NSURL URLWithString:@"http://sw.bos.baidu.com/sw-search-sp/software/50045684f7da6/QQ_mac_5.4.1.dmg"];
    NSLog(@"开始");
    self.downloadTask = [self.session downloadTaskWithURL:url];
    [self.downloadTask resume];
    NSLog(@"%@",[NSThread currentThread]);
}

//暂停
- (IBAction)pause:(id)sender {
    NSLog(@"暂停");
    [self.downloadTask cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
        //resumeData : 续传的数据(下载了多少)
        NSLog(@"数据的长度是: %tu",resumeData.length);
        self.resumeData = resumeData;
        
        //释放下载任务
        // - 让我们tast设置为week 就可以不用释放了!
        // - 因为任务都是由Session发起的!!而Session对发起的任务都会持有一个强引用!
        self.downloadTask = nil;
    }];
}


//继续
- (IBAction)resume:(id)sender {
    if (self.resumeData == nil) {
        NSLog(@"哥么没有暂停的任务");
        return;
    }
    //所有任务都是由session发起的!
    //使用续传数据启动下载任务
    self.downloadTask = [self.session downloadTaskWithResumeData:self.resumeData];
    //清空续传数据
    self.resumeData = nil;
    
    //所有的任务都是默认挂起的!!
    [self.downloadTask resume];
}


#pragma mark - <NSURLSessionDownloadDelegate>
/**
 iOS 7.0 ,一下三个方法都是必须实现的!! 到了 iOS 8.0 只剩下下载完成是必须的!!
 
 */


//1. 下载完成方法
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    NSLog(@"完成 %@",location);
    //完成任务,
    [self.session finishTasksAndInvalidate];
    //清空Session
    self.session = nil;
    
}


//2.下载进度
/**
 1.session  
 2.downloadTask                 调用代理方式的的下载任务!
 3.bytesWritten                 本次下载的字节数!
 4,totalBytesWritten            已经下载的字节数!
 5,totalBytesExpectedToWrite    期望下载的字节数-->文件总大小!
 */
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    float progress = (float) totalBytesWritten / totalBytesExpectedToWrite;
    NSLog(@"%f %@",progress,[NSThread currentThread]);
    //回到主线程更新UI
    dispatch_async(dispatch_get_main_queue(), ^{
        self.progressView.progress = progress;
    });
}


//3.下载续传数据
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes
{
    
}



@end
