//
//  DSLObject.h
//  DSL2
//
//  Created by sw on 2018/7/28.
//  Copyright © 2018年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 如果类不是系统类，那么只需要提供一个block property或者一个返回值为block的方法。
@interface DSLObject : NSObject

//@property(nonatomic, copy) DSLObject* (^name)(NSString *name);
//@property(nonatomic, copy) DSLObject* (^address)(NSString *address);
//@property(nonatomic, copy) DSLObject* (^age)(NSUInteger age);

- (DSLObject* (^)(NSString *))name;
- (DSLObject* (^)(NSString *))address;
- (DSLObject* (^)(NSUInteger))age;

#pragma mark - 只读
@property(nonatomic, copy, readonly) NSString *p_name;
@property(nonatomic, assign, readonly) NSUInteger p_age;
@property(nonatomic, copy, readonly) NSString *p_address;

@end
