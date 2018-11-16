//
//  ViewController.m
//  Runtime007
//
//  Created by hzg on 2018/9/10.
//  Copyright © 2018年 tz. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "TZPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    TZPerson* p = [TZPerson new];
    p.name = @"Cat";
    p.age = 18;
    p.nick = @"Tom";
    
    NSString* path = [NSString stringWithFormat:@"%@/archiver.plist", NSHomeDirectory()];
    
    // 归档
    [NSKeyedArchiver archiveRootObject:p toFile:path];
    
    /// 解档
    TZPerson* p2 = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSLog(@"name = %@, age = %d", p2.name, p2.age);
    
   // [self classTest];
}


- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s", __func__);
}

void hunting(id self, SEL _cmd) {
    NSLog(@"%s", __func__);
}

- (void) classTest {
    
    /// 创建一类对
    Class TZCat = objc_allocateClassPair([NSObject class], "TZCat", 0);
    
    /// 添加实例变量
    // const char* types= "v@:"
    NSString* name = @"name";
   
    class_addIvar(TZCat, name.UTF8String, sizeof(id), log2(sizeof(id)), @encode(id));
    
    // 添加方法
    class_addMethod(TZCat, @selector(hunting), (IMP)hunting, "v@:");
    
    /// 注册类
    objc_registerClassPair(TZCat);
    
  
    
    // 创建实例对象
    id cat = [[TZCat alloc] init];
    [cat setValue:@"Tom" forKey:@"name"];
    NSLog(@"name = %@", [cat valueForKey:name]);
    
    /// 方法调用
    [cat performSelector:@selector(hunting)];
    
}


@end
