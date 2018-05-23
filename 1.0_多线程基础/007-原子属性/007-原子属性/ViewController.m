//
//  ViewController.m
//  007-原子属性
//
//  Created by mac on 2018/5/2.
//  Copyright © 2018年 mac. All rights reserved.
//strong week assign

#import "ViewController.h"

@interface ViewController ()
//nonatomic 非原子属性
//atomic 原子属性，保证这个属性的安全性（线程安全），就是针对多线程设计的
//原子属性的目的：多个线程写入这个对象的时候，保证同一时间只有一个线程能够执行

//单写多读的一种多线程技术，同样可能出现“脏数据”，重新读一下

@property(nonatomic,strong)NSObject * lockObjc;
/*原子属性*/
@property(atomic,strong)NSObject * myAtomic;

@end

@implementation ViewController

@synthesize myAtomic = _myAtomic;
/**
 OC中定义属性，通常会生成 _成员变量  如果同时重写了getter和setter方法 _成员变量就不自动生成
@synthesize  合成指令，在Xcode4.5 之前非常常见
 
 @param myAtomic 自定义成员变量
 */


/**
 实际上，原子属性内部有一个锁，自旋锁
 自旋锁 & 互斥锁
 -共同点：
   都能够保证线程安全
 -不同点：
   互斥锁：如果线程被锁在外面，线程就会进入休眠状态，等待锁打开，然后被唤醒
   自旋锁：如果线程被锁在外面，线程就会用死循环的方式一直等待锁被打开
 
 总结：无论什么锁，都很消耗性能，效率不高
 
 */


/**
  * 线程安全
   在多个线程进行读写操作时，仍然保证数据正确
  * UI线程，共同约定：所有更新UI的操作都放在主线程上执行
   原因：UIKit框架都是线程不安全的！！（因为线程安全效率下降！）
 */
-(void)setMyAtomic:(NSObject *)myAtomic{
    @synchronized(self){//互斥锁 加锁
        _myAtomic = myAtomic;
    }
}

-(NSObject *)myAtomic{
    return _myAtomic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSData * data;
    //原子属性 ==YES 先把文件保存在一个临时的文件中，等全部写入后，再改名
    [data writeToFile:@"wt.mp4" atomically:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
