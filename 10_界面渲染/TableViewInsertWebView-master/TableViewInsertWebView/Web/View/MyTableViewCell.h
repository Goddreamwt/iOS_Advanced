//
//  MyTableViewCell.h
//  TableViewInsertWebView
//
//  Created by zhangyan on 2017/6/28.
//  Copyright © 2017年 zhangyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width

@class WebModel;

@interface MyTableViewCell : UITableViewCell

/** <#注释#> */
@property (nonatomic, strong)WebModel * model;

@end
