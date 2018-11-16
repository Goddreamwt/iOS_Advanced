//
//  TZPerson.m
//  Runtime007
//
//  Created by hzg on 2018/9/10.
//  Copyright © 2018年 tz. All rights reserved.
//

#import "TZPerson.h"
#import <objc/runtime.h>

@implementation TZPerson

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    unsigned int count = 0;
    Ivar* ivars = class_copyIvarList([self class], &count);
    
    for (int i = 0; i < count; i++) {
        Ivar var = ivars[i];
        const char* name = ivar_getName(var);
        NSString* key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    
    free(ivars);
    
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self == [super init]) {
        unsigned int count = 0;
        Ivar* ivars = class_copyIvarList([self class], &count);
        
        for (int i = 0; i < count; i++) {
            Ivar var = ivars[i];
            const char* name = ivar_getName(var);
            NSString* key = [NSString stringWithUTF8String:name];
            id value = [aDecoder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
        
        free(ivars);
    }
    return self;
}

@end
