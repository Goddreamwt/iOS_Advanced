//
//  Person.h
//  002-NSNumber属性
//
//  Created by mac on 2018/5/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
/** id **/
@property(nonatomic,strong)NSNumber * ID;
/** 名称 **/
@property(nonatomic,strong)NSString * Username;
/** 年龄 **/
//技巧：使用NSNumber 记录数值，可以避免后台返回 null，无法返回kvc
@property(nonatomic,strong)NSNumber * age;

@end
