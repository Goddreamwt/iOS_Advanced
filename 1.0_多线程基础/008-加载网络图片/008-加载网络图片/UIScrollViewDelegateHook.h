//
//  UIScrollViewDelegateHook.h
//  008-加载网络图片
//
//  Created by mac on 2018/5/8.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollViewDelegateHook : NSObject <UIScrollViewDelegate>

+ (void)exchangeUIScrollViewDelegateMethod:(Class)aClass;

@end
