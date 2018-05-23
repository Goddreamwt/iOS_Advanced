//
//  Person.m
//  002-NSNumber属性
//
//  Created by mac on 2018/5/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Person.h"

@implementation Person

//首字母大写 key kvc可以识别
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"%@",key);
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }
}
//
//-(void)setNilValueForKey:(NSString *)key{
//    
//}
@end
