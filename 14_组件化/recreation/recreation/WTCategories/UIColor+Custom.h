//
//  UIColor+Custom.h
//  TZVideoDemo
//
//  Created by Dream on 2018/7/31.
//  Copyright © 2018年 TZ. All rights reserved.
//

#import <UIKit/UIKit.h>

//----------------------1.6 创建了颜色的分类----------------------
@interface UIColor (Custom)

+ (instancetype)colorWithHexString:(NSString *)hexStr;

+ (instancetype)colorWithHexString:(NSString *)hexStr alpha:(CGFloat)alpha;

@end
//--------------------------end--------------------------
