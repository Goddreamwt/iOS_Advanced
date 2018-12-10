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
    //[p setValue:@"wt" forKey:@"name"];
    //NSLog(@"%@",[p valueForKey:@"name"]);
    
    //KVC控件属性赋值
    //[self.text setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    //验证KVC赋值过程
    //[p setValue:@"wt" forKey:@"name"];
    
    //验证KVC取值过程
    //NSLog(@"name = %@",[p valueForKey:@"name"]);
    
    //setValueforKey与setValueforKeyPath的区别
    [p setValue:@"wt的🐶" forKeyPath:@"dog.name"];
    NSLog(@"dog.name = %@",[p valueForKeyPath:@"dog.name"]);
    
    NSLog(@"name = %@",p->name);
//    NSLog(@"_name = %@",p->_name);
    NSLog(@"isname = %@",p->isName);
    NSLog(@"_isname = %@",p->_isName);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
