//
//  ViewController.m
//  002--监测用户网络
//
//  Created by H on 16/8/11.
//  Copyright © 2016年 TanZhou. All rights reserved.
//

//AFN AFNetworkReachabilityManager

#import "ViewController.h"
#import "Reachability.h"

@interface ViewController ()
/** 网络状态监测管理者  */
@property(nonatomic,strong)Reachability * reachabilityManager;
@end

@implementation ViewController
-(Reachability *)reachabilityManager
{
    if (!_reachabilityManager) {
        //如果指定主机名,有两个选择
        //1.找一个几乎不会down机的服务器
        //2.在实际开发中,通常只是访问一个固定的服务器
        _reachabilityManager = [Reachability reachabilityWithHostName:@"baidu.com"];
    }
    return _reachabilityManager;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //使用通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(chechStatus) name:kReachabilityChangedNotification object:nil];
    //启动监听
    [self.reachabilityManager startNotifier];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self chechStatus];
    
}

//MARK : 联网状态监测
// 提示: 联网状态监测,不需要监听,每次做网络访问之前判断一下就OK了!
-(void)chechStatus{
    switch (self.reachabilityManager.currentReachabilityStatus) {
        case NotReachable:
            NSLog(@"没有联网");
            break;
        case ReachableViaWiFi:
            NSLog(@"不花钱,死劲并发!!!");
            break;
        case ReachableViaWWAN:
            NSLog(@"花钱!花流量!!!");
            break;
        default:
            break;
    }
}


-(void)dealloc
{
    [self.reachabilityManager stopNotifier];
    //注销通知
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
