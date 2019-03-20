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
//---------------------------1.7 去掉属性 --------------------------
// 可以去掉了, 在collectionViewProxy中已经有SegmentedControl
//@property (nonatomic, strong) UIView *tabSegmentedControl;
//---------------------------------end-------------------------------------
@property (nonatomic, strong) HomeCollectionViewProxy *collectionViewProxy;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    //---------------------------1.7 改成segmentedControl --------------------------
    // 将segmentedControl添加到collectionView
    [self.contentView addSubview:self.collectionViewProxy.segmentedControl];
    [_collectionViewProxy.segmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
        // 收尾顶部的约束
        make.leading.trailing.top.equalTo(self.contentView);
        make.height.equalTo(@50);
    }];
    //---------------------------------end-------------------------------------
    
    [self.contentView addSubview:self.collectionViewProxy.collectionView];
    
    //----------------------1.5用Masonry进行自动布局-------------------
    // 设置约束
    [self.collectionViewProxy.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_collectionViewProxy.segmentedControl.mas_bottom);
        make.leading.trailing.bottom.equalTo(self.contentView);
    }];
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
        _collectionViewProxy.dataArray = @[@"1",@"2",@"3"];
    }
    return _collectionViewProxy;
}


@end
