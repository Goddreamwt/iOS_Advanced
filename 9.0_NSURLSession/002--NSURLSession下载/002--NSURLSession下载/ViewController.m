//
//  ViewController.m
//  002--NSURLSession下载
//
//  Created by H on 2017/2/20.
//  Copyright © 2017年 TZ. All rights reserved.
//  静态库  - 每一个应用程序都会有一个副本
//  动态库,在系统中只有一个副本,只有苹果公司能够建立动态库!! 当然!开发者也可以开发动态库,但是不允许上架!

#import "ViewController.h"
#import "SSZipArchive.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSURL * url = [NSURL URLWithString:@"http://192.168.31.180/sszip.zip"];
    
    /*
     如果在回调方法中,不做任何处理,下载的文件会被删除
     下载文件放在temp里面的!系统会自动回收这块区域!
     
     
     设计的目的是什么?
     - 通常从网络上下载文件,什么格式文件最多 -> zip 文件最多!可以替用户节约流量!
     - 如果是 zip 包,下载之后,需要解压
     - 解压缩之后,原始的 zip 文件就不在需要了.系统会自动帮我们删除!
     
     */
    [[[NSURLSession sharedSession] downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"%@",location);
        //下载结束,解压缩到目标路径
        NSString * cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        /** 只需要知道目标路径,不需要知道目标文件 */
        // 因为一个压缩包中有可能有多个文件
        [SSZipArchive unzipFileAtPath:location.path toDestination:cachePath];
        
    }] resume];
    
    
}


@end
