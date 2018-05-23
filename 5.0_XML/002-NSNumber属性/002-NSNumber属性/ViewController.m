//
//  ViewController.m
//  002-NSNumber属性
//
//  Created by mac on 2018/5/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURL * url = [NSURL URLWithString:@"http://127.0.0.1/demo.json"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        //反序列化
        NSArray * result = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        for (NSDictionary * dict in result) {
            Person * p =[[Person alloc]init];
            //kvc赋值
            [p setValuesForKeysWithDictionary:dict];
            NSLog(@"%@ %@ %@",p.ID,p.Username,p.age);
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
