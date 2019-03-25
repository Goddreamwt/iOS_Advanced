//
//  TZResponse.h
//  TZVideoDemo
//
//  Created by Dream on 2018/7/31.
//  Copyright © 2018年 TZ. All rights reserved.
//

#import "JSONModel.h"

//----------------------1.6版本-新增数据模型--------------------
@interface WTResponse : JSONModel

@property(nonatomic, strong) NSNumber *code;
@property(nonatomic, strong) NSString *msg;

@end
//--------------------------end-----------------------------
