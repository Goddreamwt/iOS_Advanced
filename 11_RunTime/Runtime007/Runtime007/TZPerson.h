//
//  TZPerson.h
//  Runtime007
//
//  Created by hzg on 2018/9/10.
//  Copyright © 2018年 tz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TZPerson : NSObject <NSCoding>

@property (nonatomic, strong) NSString* name;
@property (nonatomic, assign) int age;
@property (nonatomic, strong) NSString* nick;

@end
