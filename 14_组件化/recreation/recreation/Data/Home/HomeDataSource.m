//
//  HomeDataSource.m
//  recreation
//
//  Created by 王涛 on 2019/3/22.
//  Copyright © 2019年 WT. All rights reserved.
//

#import "HomeDataSource.h"

@implementation HomeDataSource

// 根据频道id获取分类频道的数据(推荐,it互联网,热门...)
- (void)getChannel:(NSString *)channelId completion:(void (^)(BOOL succeed, NSError *error, id data))cBlock {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Home_TableView_Response" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    NSError *error = nil;
    HomeTemplateResponse *response = [[HomeTemplateResponse alloc] initWithData:data error:&error];
    if (cBlock) cBlock(YES, error, response);
}

@end
