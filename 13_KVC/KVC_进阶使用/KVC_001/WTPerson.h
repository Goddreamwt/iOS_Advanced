//
//  WTPerson.h
//  KVC_001
//
//  Created by mac on 2018/12/7.
//  Copyright © 2018年 WT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTPerson : NSObject

/** name  **/
@property(nonatomic,strong)NSString * name;

/** age  **/
@property(nonatomic,assign)int age;

/** nick  **/
@property(nonatomic,strong)NSString* nick;

/** height  **/
@property(nonatomic,assign)float height;

/** count  **/
@property(nonatomic,assign)NSUInteger count;

/** penArr  **/
@property(nonatomic,strong)NSMutableArray * penArr;

@end
