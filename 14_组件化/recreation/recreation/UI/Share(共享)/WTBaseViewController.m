//
//  WTBaseViewController.m
//  recreation
//
//  Created by mac on 2019/2/28.
//  Copyright © 2019年 WT. All rights reserved.
//

#import "WTBaseViewController.h"

@interface WTBaseViewController ()

@end

@implementation WTBaseViewController

//------1.0版本更新：基本搭建tab页-----
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    //----------------------1.6 iOS11的安全区域配置----------------------
    [self.view addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        // @available(iOS 11.0, *)  @available系统提供的写法, 指定系统版本.
        if (@available(iOS 11.0, *)) {
            // iOS11 安全区域的布局
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            // 首尾的约束
            make.leading.trailing.equalTo(self.view);
            make.top.equalTo(self.mas_topLayoutGuide);
            make.bottom.equalTo(self.mas_bottomLayoutGuide);
        }
    }];
    
    //测试
    UIButton * action = [UIButton buttonWithType:UIButtonTypeCustom];
    [action setFrame:CGRectMake(100, 100, 100, 50)];
    [action setTitle:@"action" forState:UIControlStateNormal];
    [action addTarget:self action:@selector(jumpAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:action];
}

-(void)jumpAction:(id)sender{
    WTBaseViewController * vc = [[WTBaseViewController alloc]init];
    //隐藏跳转页面tabbar底部
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

//1.6版本-懒加载
- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [UIView new];
        _contentView.backgroundColor = [UIColor clearColor];
    }
    return _contentView;
}
@end
