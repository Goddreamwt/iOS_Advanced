//
//  HomeDataSource.h
//  recreation
//
//  Created by 王涛 on 2019/3/22.
//  Copyright © 2019年 WT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeTemplateResponse.h"

@interface HomeDataSource : NSObject
//----------------------1.9版本-新增方法--------------------
// 根据频道id获取分类频道的数据(推荐,it互联网,热门...)
- (void)getChannel:(NSString *)channelId completion:(void (^)(BOOL succeed, NSError *error, id data))cBlock;

@end
