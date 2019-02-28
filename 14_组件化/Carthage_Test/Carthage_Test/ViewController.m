//
//  ViewController.m
//  Carthage_Test
//
//  Created by mac on 2019/2/14.
//  Copyright © 2019年 WT. All rights reserved.
//

#import "ViewController.h"
#import <SDWebImage/SDWebImage.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:imageView];
    [imageView sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1550833173427&di=67f79a3bd5531107c434a6dbab5f7631&imgtype=0&src=http%3A%2F%2Fs7.sinaimg.cn%2Fmw690%2F001m1Utdzy6ZLnVyRxQe6%26690"]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
