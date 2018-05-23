//
//  ViewController.m
//  001-GCD常见代码演示
//
//  Created by mac on 2018/5/3.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)UIScrollView * scrollView;
@property(nonatomic,weak)UIImageView *imageView;
@property(nonatomic,strong)UIImage * image;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self downImageGCD];
}

-(void)loadView{
    //搭建界面
    self.scrollView =[[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view  =self.scrollView;

    //imageView
    UIImageView * iv =[[UIImageView alloc]init];
    //会调用view的getter方法。loadView方法在执行的过程中，如果self.view == nil，会自动调用loadView加载
    [self.view addSubview:iv];
    self.imageView = iv;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self downImageGCD];
}

//MARK - GCD 常见代码

/**
 同步执行方法，这句话不执行完，就不会执行下一个任务，同步执行不会开启线程
 */
-(void)gcdDemo1{
    //1.创建队列
    dispatch_queue_t q = dispatch_get_global_queue(0, 0);
    //2.任务添加到队列中
    //2.1 定义任务 -- block
    
    void(^task)(void) = ^{
        NSLog(@"%@",[NSThread currentThread]);
    };
    
    //2.2 添加任务到队列，并且会执行
    dispatch_sync(q, task);
    
//    dispatch_sync(q, ^{
//
//    });
}


/**
 异步执行任务  如果任务没有执行完毕，可以不用等待，异步执行下一个任务，具备开启线程的能力，异步通常又是多线程的代名词。
 */
-(void)gcdDemo2{
    //1.创建队列
    dispatch_queue_t q = dispatch_get_global_queue(0, 0);

    //2.定义任务--block 3.添加任务到队列
    dispatch_async(q, ^{
        NSLog(@"%@",[NSThread currentThread]);
    });
}

-(void)gcdDemo3{
    //指定任务执行方法 -- 异步执行
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //耗时操作
        NSLog(@"%@",[NSThread currentThread]);
        //更新UI  主队列，就是专门负责在主线程上调度任务的队列
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"更新UI%@",[NSThread currentThread]);
        });
    });
}

-(void)downImageGCD{
    //MARK: - 利用GCD来做下载图片
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //异步执行
        NSURL * url =[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1525326853527&di=56bda83da629c944572273eb3793ede9&imgtype=0&src=http%3A%2F%2Fscimg.jb51.net%2Fallimg%2F170209%2F106-1F20916102V08.jpg"];
        NSData * data =[NSData dataWithContentsOfURL:url];
        UIImage * image =[UIImage imageWithData:data];
        //更新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
            [self.imageView sizeToFit];
            self.scrollView.contentSize = image.size;
        });
    });
}
@end
