//
//  ViewController.m
//  001--NSURLConnection
//
//  Created by H on 2017/2/17.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import "ViewController.h"
/*
 NSURLConnectionDownloadDelegate 千万不要用!!! 专门针对杂志的下载提供的接口
 如果在开发中使用DownloadDelegate 下载.能够监听下载进度,但是无法拿到下载文件!
 Newsstand Kit’s 专门用来做杂志!!!
 */
@interface ViewController ()<NSURLConnectionDataDelegate>

/** 要下载文件的总大小 */
@property(assign,nonatomic)long long  expectedContentLength;
/** 当前下载的长度 */
@property(assign,nonatomic)long long currentLength;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
/** 下载线程的运行循环 */
@property(assign,nonatomic)CFRunLoopRef downloadRunloop;
/** 保存目标 */
@property(copy,nonatomic)NSString * tartgetFilePath;


/** 保存文件的输出流  
 - (void)open;   写入之前,打开流
 - (void)close;  完成之后,关闭流

 */

@property(nonatomic,strong)NSOutputStream * fileStream;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/*
问题: 
 1.没有下载进度 ,会影响用户体验
 2.内存偏高,有一个最大峰值:
 
 
 解决办法:
    - 通过代理方式来解决!!
    1.进度跟进!
      - 在响应方法中获得文件总大小!
      - 每次接收到数据,计算数据的总比例!
    2.保存文件的思路?
      - 保存完成写入磁盘
        测试结果:和异步方法执行的效果一样.仍然存在内存问题!
        推测:苹果的异步方法的实现思路.就是刚才我们的实现思路!!
 
      - 边下载,边写  
        1.NSFileHandle 测地解决了内存峰值的问题!
        2.NSOutputStream 输出流
 
 新的问题:
    默认Connection 是在主线程工作,指定了代理的工作队列之后,整个下载仍然是在主线程!!UI事件能够卡住下载!
 */

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 将网络操作放在异步线程,异步的运行循环不启动,没有办法监听到网络事件!!
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //1.url
        NSString * urlStr = @"http://127.0.0.1/002--加密算法介绍.wmv";
        urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL * url = [NSURL URLWithString:urlStr];
        
        //2.request
        NSURLRequest * request = [NSURLRequest requestWithURL:url];
        
        //3.connection
        NSLog(@"开始 %@",[NSThread currentThread]);
        /*
         For the connection to work correctly, the calling thread’s run loop must be operating in the default run loop mode.
         为了保证连接的正常工作,调用线程的RunLoop 必须运行在默认的运行循环模式下!!
         */
        NSURLConnection * conn = [NSURLConnection connectionWithRequest:request delegate:self];
        //设置代理工作的操作队列
        [conn setDelegateQueue:[[NSOperationQueue alloc]init]];
        //4.启动连接
        [conn start];
        
        //5. 启动运行循环
        //CoreFoundation 框架 CFRunloop
        /*
        CFRunLoopStop(r)        停止指定的RunLoop
        CFRunLoopGetCurrent()   拿到当前的RunLoop
        CFRunLoopRun();         直接启动当前的运行循环
         */
        //1.拿到当前线程的运行循环
        self.downloadRunloop = CFRunLoopGetCurrent();
        //2.启动运行循环
        CFRunLoopRun();
        NSLog(@"来了!!");
    });
}



#pragma mark - <NSURLConnectionDataDelegate>


//1.接受到服务器的响应  - 状态行&响应头 - 做一些准备工作
//expectedContentLength  需要下载文件的总大小 long long
//suggestedFilename      服务器建议保存的文件名称

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"%@",response);
    //记录文件总大小
    self.expectedContentLength = response.expectedContentLength;
    self.currentLength = 0;
    //生成目标文件路径
    self.tartgetFilePath = [@"/Users/h/Desktop/123" stringByAppendingPathComponent:response.suggestedFilename];
    //删除 removeItemAtPath 如果文件存在,就会直接删除,如果文件不存在,就什么也不做!!也不会报错!
    [[NSFileManager defaultManager] removeItemAtPath:self.tartgetFilePath error:NULL];
    
     //输出流  以追加的方式打开文件流
    self.fileStream = [[NSOutputStream alloc]initToFileAtPath:self.tartgetFilePath append:YES];
    [self.fileStream open];
    
}

//2.接受到服务器的数据 - 此代理方法可能会执行很多次!! 因为拿到多个data
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    self.currentLength += data.length;
    //计算百分比
    // progress = long long / long long
    float progress = (float)self.currentLength / self.expectedContentLength;
    NSLog(@"%f  %@",progress,[NSThread currentThread]);
    
    //在主线程更新UI
    dispatch_async(dispatch_get_main_queue(), ^{
        self.progressView.progress = progress;
    });
    
    //将数据追加到文件流中
    [self.fileStream write:data.bytes maxLength:data.length];
}


//3.所有的数据加载完毕 - 所有数据都传输完毕,只是一个最后的通知
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"完毕  %@",[NSThread currentThread]);
    //关闭文件流
    [self.fileStream close];
    //停止下载线程所在的运行循环
    CFRunLoopStop(self.downloadRunloop);
}

//4.下载失败或者错误
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
}



@end
