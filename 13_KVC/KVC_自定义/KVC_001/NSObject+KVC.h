//
//  NSObject+KVC.h
//  KVC_001
//
//  Created by mac on 2018/12/10.
//  Copyright © 2018年 WT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KVC)

- (void)wt_setValue:(nullable id)value forKey:(NSString *)key;

- (id)wt_valueForKey:(NSString *)key;

@end
