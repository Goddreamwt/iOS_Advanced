//
//  ViewController.m
//  006-资源共享
//
//  Created by mac on 2018/5/2.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//票数
@property(assign,atomic)int tickets;
//锁
@property(nonatomic,strong)NSObject * lockObjc;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _lockObjc =[NSObject new];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.tickets = 20;
    NSThread * t1 =[[NSThread alloc]initWithTarget:self selector:@selector(saleTickets) object:nil];
    t1.name =@"售票员A";
    [t1 start];
    
    NSThread * t2 =[[NSThread alloc]initWithTarget:self selector:@selector(saleTickets) object:nil];
    t2.name =@"售票员B";
    [t2 start];
}

-(void)saleTickets{
    while (YES) {
        [NSThread sleepForTimeInterval:1.0];
        //互斥锁 -- 保证锁内的代码，同一时间只有一条线程执行
        //互斥锁的范围应该尽量小，范围打了，效率就差
        //参数：任意OC对象都OK！一般用self
        
        //局部变量，每一个线程单独拥有的，因此没法加锁！！
        NSObject * lock =[NSObject new];
        @synchronized(self.lockObjc){
            //    1.判断是否有票
            if(self.tickets >0){
                //2.如果有就卖一张
                self.tickets--;
                NSLog(@"剩下%d张票 %@",self.tickets,[NSThread currentThread]);
            }else{
                //3.如果没有了，提示用户
                NSLog(@"卖完了！%@",[NSThread currentThread]);
                break;
            }
        }
        
    }
}
@end
