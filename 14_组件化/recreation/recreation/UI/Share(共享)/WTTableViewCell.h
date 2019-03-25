//
//  WTTableViewCell.h
//  recreation
//
//  Created by 王涛 on 2019/3/14.
//  Copyright © 2019年 WT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTTableViewCell : UITableViewCell

//1.4添加基类cell

//----------------------1.9版本-添加数据配置方法----------------------
// 数据配置
- (void)configWithData:(id)data;
//-------------------------------end-------------------------------
@end
