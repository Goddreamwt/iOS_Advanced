//
//  HKProgressBtn.m
//  002--NSURLSession下载
//
//  Created by H on 2017/2/20.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import "HKProgressBtn.h"

@implementation HKProgressBtn

-(void)setProgress:(float)progress
{
    _progress = progress;
    
    //设置标题
    [self setTitle:[NSString stringWithFormat:@"%.02f%%",_progress * 100] forState:(UIControlStateNormal)];
    
    //刷新视图
    [self setNeedsDisplay];
}
/*
    写一个宏 myMIN(a,b) 返回最小值
    写一个宏 myMIN3(a,b,c) 返回最小值
 */
#define myMIN(a,b) (((a) < (b))?(a):(b))
#define myMIN3(a,b,c) myMIN(myMIN(a,b),c)

// 自己定义
-(void)drawRect:(CGRect)rect
{
    
    CGSize s = rect.size;
    CGPoint center = CGPointMake(s.width * 0.5, s.height * 0.5);
    CGFloat r = myMIN(s.height,s.width) * 0.5;
    r -= 5.0;
    CGFloat startAng = - M_PI_2;
    CGFloat endAng = self.progress * 2 * M_PI + startAng;
    /**
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
    [[UIColor blueColor] setStroke];
    
    //绘制路径
    [path stroke];
    
}

@end
