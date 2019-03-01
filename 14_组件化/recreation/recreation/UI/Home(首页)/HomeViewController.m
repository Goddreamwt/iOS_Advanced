//
//  HomeViewController.m
//  recreation
//
//  Created by mac on 2019/2/28.
//  Copyright © 2019年 WT. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCollectionViewProxy.h"

@interface HomeViewController ()

@property (nonatomic, strong) id dataManager;
@property (nonatomic, strong) NSArray *dataArray;
//选项卡控制器
@property (nonatomic, strong) UIView *tabSegmentedControl;
@property (nonatomic, strong) HomeCollectionViewProxy *collectionViewProxy;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    // 初始化,将collectionView添加到view
    _tabSegmentedControl = [UIView new];
    [self.view addSubview:_tabSegmentedControl];
    
    [self.view addSubview:self.collectionViewProxy.collectionView];
}

#pragma mark properties 懒加载
// cell的回调就在这里面通过block来进行处理
- (HomeCollectionViewProxy *)collectionViewProxy {
    if (!_collectionViewProxy) {
        // 配置信息在这处理
        _collectionViewProxy = [[HomeCollectionViewProxy alloc] initWithReuseIdentifier:@"HomeCollectionViewCell" configuration:^(UICollectionViewCell *cell, id cellData, NSIndexPath *indexPath) {
            // 代码
            //1.3改变cell颜色,运行起来可以看到效果
            if (indexPath.row == 0) {
                cell.backgroundColor = [UIColor redColor];
            } else if (indexPath.row == 1) {
                cell.backgroundColor = [UIColor blueColor];
            } else if (indexPath.row == 2) {
                cell.backgroundColor = [UIColor yellowColor];
            }
        } action:^(UICollectionViewCell *cell, id cellData, NSIndexPath *indexPath) {
            // 点击事件到这里面处理.
            
        }];
    }
    return _collectionViewProxy;
}


@end
