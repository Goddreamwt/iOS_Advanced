//
//  DSLObject.m
//  DSL2
//
//  Created by sw on 2018/7/28.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "DSLObject.h"

@interface DSLObject()
@property(nonatomic, copy) NSString *p_name;
@property(nonatomic, assign) NSUInteger p_age;
@property(nonatomic, copy) NSString *p_address;

@end

@implementation DSLObject

#define weak_Self __weak typeof(self) weakSelf = self
#define strong_Self __strong typeof((weakSelf)) strongSelf = (weakSelf)


- (DSLObject *(^)(NSString *))name {
    weak_Self;
    return ^DSLObject *(NSString *name) {
        strong_Self;
        strongSelf.p_name = name;
        return self;
    };
}

- (DSLObject *(^)(NSUInteger))age {
    weak_Self;
    return ^DSLObject *(NSUInteger age) {
        strong_Self;
        strongSelf.p_age = age;
        return self;
    };
}

- (DSLObject *(^)(NSString *))address {
    weak_Self;
    return ^DSLObject *(NSString *address) {
        strong_Self;
        strongSelf.p_address = address;
        return self;
    };
}
@end
