//
//  WTPerson.m
//  KVC_001
//
//  Created by mac on 2018/12/7.
//  Copyright © 2018年 WT. All rights reserved.
//

#import "WTPerson.h"

@implementation WTPerson


//集合代理对象：一对多的关系
//array对应下面两个方法
-(NSUInteger) countOfBooks {
    return self.count;
}

-(id) objectInBooksAtIndex:(NSUInteger)index{
    return [NSString stringWithFormat:@"book %lu",index];
}


//set对应下面三个方法
//个数
-(NSUInteger) countOfPens{
    return [self.penArr count];
}

//是否包含这个成语对象
- (id) memberOfPens:(id)object{
    return [self.penArr containsObject:object] ? object : nil;
}

//迭代器
- (id) enumeratorOfPens {
    return [self.penArr objectEnumerator];
}

//- (id) enumeratorOfPens {
//    return [self.penArr reverseObjectEnumerator];
//}

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
