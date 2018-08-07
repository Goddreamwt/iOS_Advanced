//
//  ViewController.m
//  001-NSURLConnection下载
//
//  Created by mac on 2018/5/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"

/*
 NSURLConnectionDownloadDelegate 千万不要用！！专门针对杂志的下载提供的接口
 如果在开发中使用NSURLConnectionDownloadDelegate下载，我们能够监听下载进度，但是无法拿到下载文件
 */
@interface ViewController ()<NSURLConnectionDelegate>
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

/** 要下载文件的总大小 **/
@property(nonatomic,assign)long long expectedContentLength;
/** 当前下载的长度 **/
@property(nonatomic,assign)long long currentLength;

/** 下载线程的运行循环  **/
@property(nonatomic,assign)CFRunLoopRef downloadRunloop;

/** 保存目标 **/
@property(nonatomic,copy)NSString * targetFilePath;

@property(nonatomic,strong)NSOutputStream * fileStream;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


/**
 问题：
 1.没有下载进度，会影响用户体验
 2.内存偏高，有一个最大的峰值
 
 解决办法：
  - 通过代理方式来解决
  1.进度跟进
   - 在响应方法中获得文件总大小
   - 每次接收到数据，计算数据的总比例
  2.保存文件的思路
   - 因为一次性写入才使内存偏高
   有两种解决方式
   1.保存完成写入磁盘
   2.边下载边写入
    1.NSFileHandle 彻底解决了内存峰值的问题
    2.NSOutputStream 输出流
 
 新的问题：默认Connection是在主线程工作，指定了代理的工作队列之后，整个下载仍然是在主线程，UI事件能够卡主下载
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSString * urlStr = @"http://127.0.0.1/开班典礼介绍2017-11-27_220225.wmv";
        urlStr =[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL * url =[NSURL URLWithString:urlStr];
        
        //request
        NSURLRequest * request = [NSURLRequest requestWithURL:url];
        
        NSLog(@"开始");
        //NSURLConnection的构造方法
        NSURLConnection * con = [NSURLConnection connectionWithRequest:request delegate:self];
        //设置代理工作的操作队列
        [con setDelegateQueue:[[NSOperationQueue alloc]init]];
        //启动链接
        [con start];
    
        //5.启动运行循环
        //coreFoundation框架 CFRunloop
        /*
         CFRunloopStop() 停止指定的runloop
         CFRunLoopGetCurrent() 拿到当前的runloop
         CFRunLoopRun() 直接启动当前的运行循环
         */
        //1.拿到当前线程的运行循环
        self.downloadRunloop = CFRunLoopGetCurrent();
        //2.启动运行循环
        CFRunLoopRun();
        NSLog(@"来了！");
    });
    
}

#pragma mark - <NSURLConnectionDelegate>
//1.接受到服务器的响应 - 状态行&响应头 - 做一些准备工作
//expectedContentLength  需要下载文件的总大小 long long
//suggestedFilename 服务器建议保存的文件名称
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(nonnull NSURLResponse *)response{
    NSLog(@"%@",response);
    //记录文件总大小
    self.expectedContentLength = response.expectedContentLength;
    self.currentLength = 0;
    //生成目标文件的路径
    self.targetFilePath = [@"/Users/mac/Desktop/" stringByAppendingPathComponent:response.suggestedFilename];
    //删除(用户第二次点击下载) -- removeItemAtPath 如果文件存在，就会直接删除，如果文件不存在，就什么也不做，也不会报错
    [[NSFileManager defaultManager]removeItemAtPath:self.targetFilePath error:NULL];
    
    //输出流创建 - 以追加的方式开发文件流
    self.fileStream = [[NSOutputStream alloc]initToFileAtPath:self.targetFilePath append:YES];
    [self.fileStream open];
}

//2.接受到服务器的数据 - 此代理方法可能会执行很多次 因为拿到多个data
-(void)connection:(NSURLConnection *)connection didReceiveData:(nonnull NSData *)data{
    self.currentLength += data.length;
    //计算百分比
    //progress = long long / long long
    float progress =  (float)self.currentLength / self.expectedContentLength;
    NSLog(@"接受数据进度%f %@",progress,[NSThread currentThread]);
    //在主线程更新UI
    dispatch_async(dispatch_get_main_queue(), ^{
         self.progressView.progress = progress; //直接影响UI
    });
   
    //将数据追加到文件流中
    [self.fileStream write:data.bytes maxLength:data.length];
}
-(void)writeToFileWithData:(NSData *)data{
    
/**
 NSFileManager:主要功能，创建目录，检查目录是否存在，遍历目录，删除文件..针对文件操作Finder
 NSFileHandle:文件“句柄”，Handle意味着是对前面单词的“File” 操作或者处理
    主要功能：就是对同一个文件进行二进制的读和写
 */
    //注意：fp 中的 p 是指指针 文件句柄也可以理解为文件指针
    //如果文件不存在，fp 在实例化的结果是空
    NSFileHandle * fp = [NSFileHandle fileHandleForWritingAtPath:self.targetFilePath];
    //判断文件是否存在,直接将数据写入磁盘
    if (fp == nil) {
        [data writeToFile:self.targetFilePath atomically:YES];
    }else{
        //如果存在
        //1.将文件指针移到文件的末尾
        [fp seekToEndOfFile];
        //2.写入文件
        [fp writeData:data];
        //3.关闭文件 在c语音的开发中，泛是涉及到文件读写，都有打开和关闭的操作
        [fp closeFile];
    }
    
}
//3.所有的数据加载完毕 - 所有数据都传输完毕,只是一个最后的通知
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"完毕 %@",[NSThread currentThread]);
    //关闭文件流
    [self.fileStream close];
    
    //停止下载线程所在的运行循环
    CFRunLoopStop(self.downloadRunloop);
}

//4.下载失败或者错误
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
}
@end
