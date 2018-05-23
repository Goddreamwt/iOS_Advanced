//
//  ViewController.m
//  003-Json解析
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
    NSURL * url = [NSURL URLWithString:@"http://127.0.0.1/demo.json"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
       //解析数据
       //二进制数据 -> OC对象：反序列化
//        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        //NSJSONSerialization JSONObjectWithData 能够将网络返回的二进制数据转换成为字典或者数组
        /*
        A class for converting JSON to Foundation objects and converting Foundation objects to JSON.
         
            An object that may be converted to JSON must have the following properties:
              一个Json对象应该具有以下属性
            - Top level object is an NSArray or NSDictionary
              顶级节点是一种数组或者字典
            - All objects are NSString, NSNumber, NSArray, NSDictionary, or NSNull
              所有对象必须是NSString, NSNumber, NSArray, NSDictionary, or NSNull
            - All dictionary keys are NSStrings
              所有的字典的KEY 必须是 NSStrings
            - NSNumbers are not NaN or infinity
              NSNumbers 不能是无理数或者空
        */
        id result = [NSJSONSerialization JSONObjectWithData:data options:1 error:NULL];
        //JSON的解析并不是表面上的那么简单
        //出现过的JSON解析的三方框架 JSONKit（iOS5.0停止更新） SBJson ToudchJSON
        NSLog(@"%@  %@",result,[result class]);
        for (NSDictionary * dict in result) {
            NSLog(@"==> %@",dict);
        }
    }];
}

//MARK:关于枚举
/*
  C语言定义枚举的类型，枚举的数据类型是不确定的，会默认的使用int
  iOS6.0之后推出两个宏 NS_ENUM & NS_OPTIONS
 
 NS_ENUM:定义枚举的同时，指定数据的类型
 NS_OPTIONS：定义的枚举是位移的，可以用按位或 来设置数值
 如果看到NS_OPTIONS 定义的枚举，直接传入0 作为参数，表示什么附加操作也不做，效率最高
 
 options:
 typedef NS_OPTIONS(NSUInteger, NSJSONReadingOptions) {
 NSJSONReadingMutableContainers = (1UL << 0), 容器节点是可变的
 NSJSONReadingMutableLeaves = (1UL << 1),     子节点是可变的
 NSJSONReadingAllowFragments = (1UL << 2)     允许顶级节点不是 NSArray 或者 NSDictionary
 } API_AVAILABLE(macos(10.7), ios(5.0), watchos(2.0), tvos(9.0));
 
 按位或示例：
 id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:NULL];
 */


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
