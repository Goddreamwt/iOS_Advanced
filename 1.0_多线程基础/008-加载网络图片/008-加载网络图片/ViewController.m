//
//  ViewController.m
//  008-加载网络图片
//
//  Created by mac on 2018/5/3.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView * scrollView;
@property(nonatomic,weak)UIImageView *imageView;
@property(nonatomic,strong)UIImage * image;
/**
 问题一.为什么scrollView用strong修饰？imageView用week？
 */

@end

@implementation ViewController


/**
 加载视图结构，纯代码开发
 功能  SB&XIB 是一样的
 如果重写了这个方法，SB和XIB都无效
 */
//-(void)loadView{
//
//}

/**
 视图加载完毕
 一般做初始化工作
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //搭建界面
    CGSize size = self.view.frame.size;
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 170, size.width, size.height - 80)];
    [self.view addSubview:self.scrollView];
    //MARK:-设置缩放属性
    self.scrollView.delegate = self;
    self.scrollView.minimumZoomScale = 0.5;
    self.scrollView.maximumZoomScale = 2.0;
    
    //imageView
    UIImageView * iv =[[UIImageView alloc]init];
    //会调用view的getter方法。loadView方法在执行的过程中，如果self.view == nil，会自动调用loadView加载
    [self.view addSubview:iv];
    self.imageView = iv;
    
//    [self downloadImage];
//    NSThread * t1 =[[NSThread alloc]initWithTarget:self selector:@selector(downloadImage) object:nil];
//    [t1 start];
    
    
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


//MARK: - 下载图片
-(void)downloadImage{
    NSLog(@"%@",[NSThread currentThread]);
    
    //NSUTL -> 统一资源定位符，每一个URL，对应着一个网络资源
    NSURL * url =[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1525326853527&di=56bda83da629c944572273eb3793ede9&imgtype=0&src=http%3A%2F%2Fscimg.jb51.net%2Fallimg%2F170209%2F106-1F20916102V08.jpg"];
    
    //下载图片(在网络上传输的所有数据都是二进制)
    //为什么是二进制：因为物理层是网线，网线里面是电流，电流有高低电频，高低电频表示二进制.数字信号转模拟信号转电信号
    NSData * data =[NSData dataWithContentsOfURL:url];
    
    //将二进制数据转成图片并且设置图片
    //提示：不是所有的更新UI在后台线程支持都会有问题
    //重点提示：不要去尝试在后台线程更新UI，出了问题是非常诡异的
//    self.image =[UIImage imageWithData:data];
    
    //在UI线程去更新UI
    
    /**
     *1.SEL:在主线程执行的方法
     *2.传递给方法的参数
     *3.是否让当前线程等待（注意：如果当前线程是主线程，YES没有用）
     */
    //线程间通信
    [self performSelectorOnMainThread:@selector(setImage:) withObject:[UIImage imageWithData:data] waitUntilDone:NO];
    NSLog(@"come here");
}
-(void)setImage:(UIImage *)image{
    _image =image;
    NSLog(@"更新UI在%@",[NSThread currentThread]);
    //直接将图片设置到控件上
    self.imageView.image = image;
    //让imageView和image一样大
    [self.imageView sizeToFit];
    //指定scrollView的contentSize
    self.scrollView.contentSize=image.size;
}

#pragma mark - <UIScrolView代理>
//告诉ScrollView 缩放哪个View
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}


/** 二维空间中， 平面中，表示一个集合图形 x y width height
  *transform 矩阵
 *struct CGAffineTransform {
   CGFloat a(缩放比例), b, c, d（缩放比例）;
   CGFloat tx（位移）, ty（位移）;
 };
 */

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    NSLog(@"scrollViewDidScroll");
//    NSLog(@"%@",NSStringFromCGAffineTransform(self.imageView.transform));
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
