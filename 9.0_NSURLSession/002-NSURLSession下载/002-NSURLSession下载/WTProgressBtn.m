//
//  WTProgressBtn.m
//  002-NSURLSession下载
//
//  Created by mac on 2018/5/21.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "WTProgressBtn.h"

@implementation WTProgressBtn

- (void)setProgress:(float)progress{

    _progress = progress;
    
    //设置标题
    [self setTitle:[NSString stringWithFormat:@"%.02f%%",_progress * 100] forState:(UIControlStateNormal)];
    //刷新视图
    [self setNeedsDisplay];
}

//rect self.bounds
/*
 面试题：
 写一个宏，myMIN(a,b) 返回最小值
 写一个宏 myMIN3(a,b,c) 返回最小值
 */
#define myMIN(a,b) ((a) < (b))?(a):(b)
#define myMIN3(a,b,c) myMIN(myMIN(a,b),c)
//自己定义
- (void)drawRect:(CGRect)rect{
    CGSize s = rect.size;
    CGPoint center =  CGPointMake(s.width * 0.5, s.height * 0.5);
    CGFloat r = myMIN(s.height, s.width) * 0.5;
    r -= 5;
    CGFloat startAng = - M_PI_2;
    CGFloat endAng = (float)(self.progress * 2 * M_PI + startAng);
    /*
     1.圆心
     2.半径
     3.起始角度
     4.结束角度
     5.顺时针
     */

    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:center radius:r startAngle:startAng endAngle:endAng clockwise:YES];
    //设置线条宽度
    path.lineWidth = 10.0;
    path.lineCapStyle = kCGLineCapRound;
    //设置颜色
    [[UIColor yellowColor]setStroke];
    //绘制路径
    [path stroke];
}

@end
