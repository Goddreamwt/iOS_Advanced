//
//  WTPerson.m
//  KVC_001
//
//  Created by mac on 2018/12/7.
//  Copyright © 2018年 WT. All rights reserved.
//

#import "WTPerson.h"

@implementation WTPerson

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dog = [WTDog new];
    }
    return self;
}

//-(void)setName:(NSString *)name{
//    NSLog(@"%s",__func__);
//}
//
//-(void)_setName:(NSString *)name{
//    NSLog(@"%s",__func__);
//}
//
//-(void)setIsName:(NSString *)name{
//    NSLog(@"%s",__func__);
//}

//- (NSString*) getName{
//    NSLog(@"%s",__func__);
//    return @"getName";
//}

- (NSString*) name {
    return @"name";
}

//+ (BOOL)accessInstanceVariablesDirectly{
//    return NO;
//}
@end
