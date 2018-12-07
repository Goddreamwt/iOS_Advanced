//
//  ViewController.m
//  KVC_001
//
//  Created by mac on 2018/12/7.
//  Copyright © 2018年 WT. All rights reserved.
//

#import "ViewController.h"
#import "WTPerson.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *text;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WTPerson * p = [WTPerson new];
    //访问成员变量
    //p.name = @"wt";
    //NSLog(@"%@",p.name);
    
    //访问私有变量（必须要要设置为public才可访问）
    //p->_name = @"wt";
    //NSLog(@"%@",p->_name);
    
    //KVC(即使不用public修饰，也可以访问私有变量)
    [p setValue:@"wt" forKey:@"name"];
    NSLog(@"%@",[p valueForKey:@"name"]);
    
    [self.text setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
