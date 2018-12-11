//
//  WTPerson.m
//  KVC_001
//
//  Created by mac on 2018/12/7.
//  Copyright © 2018年 WT. All rights reserved.
//

#import "WTPerson.h"

@implementation WTPerson

//对非对象类型，值不能为空
- (void) setNilValueForKey:(NSString *)key{
    NSLog(@"%@ 值不能为空",key);
}

//赋值的key不存在
- (void) setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"key = %@值不存在",key);
}

//取值的key不存在
- (id) valueForUndefinedKey:(NSString *)key{
    NSLog(@"key = %@值不存在",key);
    return nil;
}

//正确性验证
- (BOOL) validateAge:(inout id  _Nullable __autoreleasing *)ioValue error:(out NSError * _Nullable __autoreleasing *)outError{
    NSNumber* value = (NSNumber*)*ioValue;
    NSLog(@"%@",value);
    if ([value integerValue] >= 0 && [value integerValue] <= 200) {
        return YES;
    }
    return NO;
}

@end
