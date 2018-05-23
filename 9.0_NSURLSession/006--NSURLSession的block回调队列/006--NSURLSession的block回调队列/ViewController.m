//
//  ViewController.m
//  006--NSURLSession的block回调队列
//
//  Created by H on 2017/2/20.
//  Copyright © 2017年 TZ. All rights reserved.
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
    NSURL * url = [NSURL URLWithString:@"http://127.0.0.1/videos.json"];
    /**
     如果使用Block 回调 ,默认哥么是异步的
     所以如果要更新UI ,需要"线程间通讯"
     */
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@",[NSThread currentThread]);
    }] resume];
    
}


@end
