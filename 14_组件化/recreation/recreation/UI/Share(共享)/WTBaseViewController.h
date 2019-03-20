//
//  WTBaseViewController.h
//  recreation
//
//  Created by mac on 2019/2/28.
//  Copyright © 2019年 WT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTBaseViewController : UIViewController

//---------------1.6 模仿cell,在基类设置contentView. 用来解决齐刘海安全区域的问题----------------
@property (nonatomic, strong) UIView *contentView; /**< 自定义内容容器 */

@end
