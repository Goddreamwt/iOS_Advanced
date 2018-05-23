//
//  ViewController.m
//  005-Plist解析
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
    //plist 很少用于传输网络数据，只是苹果使用的比较多
    NSURL * url = [NSURL URLWithString:@"http://127.0.0.1/messages.plist"];
    
    NSURLRequest * request =[NSURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:15.0];
   
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        //NSJson(JSON) NSJSONSerialization(序列化)
        //NSProperty(属性)Serialization(序列化)
        /*
         options枚举类型:
         typedef NS_OPTIONS(NSUInteger, NSPropertyListMutabilityOptions) {
         NSPropertyListImmutable = kCFPropertyListImmutable,
         不可变
         NSPropertyListMutableContainers = kCFPropertyListMutableContainers,
         容器可变
         NSPropertyListMutableContainersAndLeaves = kCFPropertyListMutableContainersAndLeaves
         容器和子节点可变的
         };
         */
       id result = [NSPropertyListSerialization propertyListWithData:data options:0 format:NULL error:NULL];
        NSLog(@"%@  %@",result,[result class]);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
