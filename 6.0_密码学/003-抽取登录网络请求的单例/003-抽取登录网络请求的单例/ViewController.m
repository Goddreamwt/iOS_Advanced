//
//  ViewController.m
//  003-抽取登录网络请求的单例
//
//  Created by mac on 2018/5/16.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"

/* 盐*/
static NSString * salt = @"lkajsd;flj)(*@$!#(*&OJKD(*&)291IOJPOIHCD*FUPOH$RO*UOIDSHFP(*EWUJRT:LK@#$U(*)_Q#R()IJD*(F_U";


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *pwdText;
@property (weak, nonatomic) IBOutlet UITextField *userText;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载用户信息
    self.view.backgroundColor =[UIColor grayColor];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginError) name:WTLoginFailedNotifcation object:nil];
}
- (IBAction)login:(id)sender {
    
}

//登录失败
-(void)loginError{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"用户名或密码错误" preferredStyle:(UIAlertControllerStyleAlert)];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:(UIAlertActionStyleDefault) handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
