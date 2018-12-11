//
//  WTContainer.m
//  KVC_001
//
//  Created by mac on 2018/12/11.
//  Copyright © 2018年 WT. All rights reserved.
//

#import "WTContainer.h"

@interface WTContainer()
@property(nonatomic,strong)NSMutableDictionary * dict;
@end

@implementation WTContainer

-(void) setValue:(id)value forUndefinedKey:(NSString *)key{
    if (!key || [key isEqualToString:@""]) {
        return;
    }
    if (!_dict) {
        _dict = [NSMutableDictionary dictionary];
    }
    [_dict setValue:value forKey:key];
}

- (id) valueForUndefinedKey:(NSString *)key{
    if (!key || [key isEqualToString:@""]) {
        return nil;
    }
    return [_dict valueForKey:key];
}
@end
