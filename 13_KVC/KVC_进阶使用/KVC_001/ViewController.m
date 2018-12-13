//
//  ViewController.m
//  KVC_001
//
//  Created by mac on 2018/12/7.
//  Copyright © 2018年 WT. All rights reserved.
//

#import "ViewController.h"
#import "WTPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self dictionaryTest];
//    [self arrayKVCTest];
//    [self containerTest];
    [self setTest];
}

//集合代理对象
- (void) setTest{
    WTPerson *p =[WTPerson new];
    p.count = 5;
    
    NSLog(@"books = %@",[p valueForKey:@"books"]);
    
    p.penArr = [NSMutableArray arrayWithObjects:@"pen0",@"pen1",@"pen2",@"pen3",nil];
    NSSet * set = [p valueForKey:@"pens"];
    NSLog(@"pens = %@",set);
    
    NSEnumerator * enumerator = [set objectEnumerator];
    NSString * str = nil;
    while (str = [enumerator nextObject]) {
        NSLog(@"%@",str);
    }
}

//KVC容器操作
-(void)containerTest{
    //聚合操作符 @avg、@conunt、@max、@min、@sum
    NSMutableArray * students = [NSMutableArray array];
    for (int i=0; i< 6; i++) {
        WTPerson * p = [WTPerson new];
        NSDictionary *dict = @{
                               @"name":@"wt",
                               @"age":@(18+i),
                               @"nick":@"Cat",
                               @"height":@(1.65+0.02*arc4random_uniform(6))
                               };
        [p setValuesForKeysWithDictionary:dict];
        [students addObject:p];
    }
    NSLog(@"所有身高：%@",[students valueForKey:@"height"]);
    
    //平均身高
    float avg = [[students valueForKeyPath:@"@avg.height"] floatValue];
    NSLog(@"平均身高：%f",avg);
    
    //数组操作符 @distinctUnionOfObjects @unionOfObjects
    
    NSArray * arr = [students valueForKeyPath:@"@distinctUnionOfObjects.height"];
    NSLog(@"去重操作：%@",arr);
    
    NSArray * arr1 = [students valueForKeyPath:@"@unionOfObjects.height"];
    NSLog(@"不去重操作：%@",arr1);
    
    
    //嵌套集合（array&set）操作 @distinctUnionOfArrays @unionOfArrays @distinctUnionOfSets
    NSMutableArray * students1 = [NSMutableArray array];
    for (int i=0; i< 6; i++) {
        WTPerson * p = [WTPerson new];
        NSDictionary *dict = @{
                               @"name":@"wt",
                               @"age":@(18+i),
                               @"nick":@"Cat",
                               @"height":@(1.65+0.02*arc4random_uniform(6))
                               };
        [p setValuesForKeysWithDictionary:dict];
        [students1 addObject:p];
    }

    NSArray * nestArr = @[students,students1];
    NSArray * arr2 = [nestArr valueForKeyPath:@"@distinctUnionOfArrays.height"];
    NSLog(@"去重操作：%@",arr2);
    
    NSArray * arr3 = [nestArr valueForKeyPath:@"@unionOfArrays.height"];
    NSLog(@"不去重操作：%@",arr3);
    
    //无序集合
    //set特点：会自动去重
    NSMutableSet * studentsSet = [NSMutableSet set];
    for (int i=0; i< 6; i++) {
        WTPerson * p = [WTPerson new];
        NSDictionary *dict = @{
                               @"name":@"wt",
                               @"age":@(18+i),
                               @"nick":@"Cat",
                               @"height":@(1.65+0.02*arc4random_uniform(6))
                               };
        [p setValuesForKeysWithDictionary:dict];
        [studentsSet addObject:p];
    }
    NSLog(@"studentsSet = %@",[studentsSet valueForKey:@"height"]);
    
    NSMutableSet * studentsSet1 = [NSMutableSet set];
    for (int i=0; i< 6; i++) {
        WTPerson * p = [WTPerson new];
        NSDictionary *dict = @{
                               @"name":@"wt",
                               @"age":@(18+i),
                               @"nick":@"Cat",
                               @"height":@(1.65+0.02*arc4random_uniform(6))
                               };
        [p setValuesForKeysWithDictionary:dict];
        [studentsSet1 addObject:p];
    }
    NSLog(@"studentsSet1 = %@",[studentsSet1 valueForKey:@"height"]);
    
    NSSet * nestSet = [NSSet setWithObjects:studentsSet,studentsSet1,nil];
    
    NSArray * arrSet2 = [nestSet valueForKeyPath:@"@distinctUnionOfSets.height"];
    NSLog(@"arrSet2 = %@",arrSet2);
}

//KVC的消息传递
-(void) arrayKVCTest{
    
    //相当于给数组中的所有成员都发送了一遍消息
    NSArray *arr =@[@"Monday",@"Tuesday",@"Wednesday"];
    NSArray *lengthArr = [arr valueForKey:@"length"];
    NSLog(@"%@",lengthArr);
    
    NSArray *lowercaseStringArr = [arr valueForKey:@"lowercaseString"];
    NSLog(@"%@",lowercaseStringArr);
}

//KVC与字典
-(void)dictionaryTest{
    WTPerson * p = [WTPerson new];

    NSDictionary * dict = @{
                            @"name":@"wt",
                            @"age":@18,
                            @"nick":@"Cat",
                            @"height":@180,
                            @"dd":@"dd"
                            };
    [p setValuesForKeysWithDictionary:dict];
    NSLog(@"p.name = %@,p.age = %d,p.nick = %@,p.height = %f",p.name,p.age,p.nick,p.height);
    
    NSArray * keys = @[@"name",@"age"];
    NSDictionary * dict1 =[p dictionaryWithValuesForKeys:keys];
    NSLog(@"%@",dict1);
}

@end
