//
//  HomeBannerTableViewCell.h
//  TZVideoDemo
//
//  Created by Dream on 2018/7/26.
//  Copyright © 2018年 TZ. All rights reserved.
//

#import "WTTableViewCell.h"
#import "TYCyclePagerView.h"

//----------------------1.4版本-添加子类cell继承基类,做图片轮播器的----------------------
@interface HomeBannerTableViewCell : WTTableViewCell

//----------------------1.9版本-添加框架图片轮播器----------------------
@property (weak, nonatomic) IBOutlet TYCyclePagerView *cycleView;
//-------------------------------end-------------------------------

@end
//-------------------------------end-------------------------------
