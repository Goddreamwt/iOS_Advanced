//
//  ViewController.m
//  DSL2
//
//  Created by sw on 2018/7/27.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "ViewController.h"
#import "DSLHeader.h"
#import "DSLObject.h"

#import "DSLViewMaker.h"
#import "DSLImageViewMaker.h"

#import "UIView+DSL.h"
#import "UIImageView+DSL.h"

#import "UIView+DSLMaker.h"
#import "UIImageView+DSLMaker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /// Category方式实现
    UIView *cView = UIView.new.DSL_frame(CGRectMake(0, 0, 100, 250)).DSL_backgroundColor([UIColor orangeColor]);
    [self.view addSubview:cView];
    
    UIImageView *cImageView = UIImageView.new.DSL_frame(CGRectMake(150, 0, 60, 60)).DSL_image([UIImage imageNamed:@"imgxxx"]);
    [self.view addSubview:cImageView];
    
    /// 中间类方式实现
    UIView *viewA = alloc_view().frame(CGRectMake(100, 50, 200, 200)).backgroundColor([UIColor blueColor]).addToSuperView(self.view).view;

    UIImageView *imageViewA = alloc_imageView().frame(CGRectMake(20, 300, 100, 100)).image([UIImage imageNamed:@"img_xinshoutishi_lishi"]).addToSuperView(self.view).view;
    
    /// 中间类+category方式实现
    UIView *viewB = UIView.make.frame(CGRectMake(200, 250, 40, 80)).backgroundColor([UIColor grayColor]).addToSuperView(self.view).view;
    UIImageView *imageViewB = UIImageView.make.frame(CGRectMake(100, 300, 100, 50)).backgroundColor([UIColor cyanColor]).addToSuperView(self.view).view;
    
    /// 自定义类
    DSLObject *obj = DSLObject.new.name(@"ws").age(27).address(@"beijing");
    NSLog(@"name : %@, age : %ld, address : %@",obj.p_name, obj.p_age, obj.p_address);
    
}

@end
