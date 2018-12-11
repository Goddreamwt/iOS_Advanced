//
//  ViewController.m
//  KVC_001
//
//  Created by mac on 2018/12/7.
//  Copyright © 2018年 WT. All rights reserved.
//

#import "ViewController.h"
#import "WTPerson.h"
#import "WTContainer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WTPerson * p = [WTPerson new];
    
    //异常处理
    [p setValue:@18 forKey:@"name"];
    [p setValue:nil forKey:@"name"];
    NSLog(@"name = %@",p.name);

    [p setValue:nil forKey:@"age"];
    NSLog(@"age = %d",p.age);

    [p setValue:@"hello" forKey:@"name1"];

    NSLog(@"name = %@",[p valueForKey:@"name1"]);

    //万能容器
    WTContainer * container = [WTContainer new];
    
    [container setValue:@"wt" forKey:@"name"];
    [container setValue:@18 forKey:@"age"];

    NSLog(@"name = %@,age = %@",[container valueForKey:@"name"],[container valueForKey:@"age"]);
    
    
    //正确性验证
    NSNumber * value = @200;
    NSNumber * value1 = @199;
    
    if ([p validateValue:&value1 forKey:@"age" error:NULL]) {
        
        [p setValue:value1 forKey:@"age"];
    }
    
    NSLog(@"%@",[p valueForKey:@"age"]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
