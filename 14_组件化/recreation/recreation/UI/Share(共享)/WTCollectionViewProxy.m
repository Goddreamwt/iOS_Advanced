//
//  WTCollectionViewProxy.m
//  recreation
//
//  Created by mac on 2019/2/28.
//  Copyright © 2019年 WT. All rights reserved.
//

#import "WTCollectionViewProxy.h"

@interface WTCollectionViewProxy () <UICollectionViewDelegate, UICollectionViewDataSource>
@end

@implementation WTCollectionViewProxy

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier configuration:(WTCVConfigBlock)cBlock action:(WTCVActionBlock)aBlock{
    if (self = [super init]) {
        _reuseIdentifier = reuseIdentifier;
        _cellConfigBlock = cBlock;
        _cellActionBlock = aBlock;
        
//        _collectionView = [UICollectionView new];
    }
    return self;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        //样式设置
        // CollectionView创建需要指定Flowlayout
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        // 滚动方向 水平
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 200, UIScreen.mainScreen.bounds.size.width, 200) collectionViewLayout:layout];
        // 翻页和滚动条的设置
        _collectionView.pagingEnabled = YES;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        // 注册cell
//        [_collectionView registerClass:NSClassFromString(@"") forCellWithReuseIdentifier:@""];
    }
    return _collectionView;
}

#pragma mark colloctionView delegate 如果有点击事件,就在这里面回调出去
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (_cellActionBlock) {
        _cellActionBlock([collectionView cellForItemAtIndexPath:indexPath], _dataArray[indexPath.row], indexPath);
    }
}

#pragma mark colloctionView datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"" forIndexPath:indexPath];
    // 需要controller做的事,就通过block回调过去,让它来处理
    if (_cellConfigBlock) {
        _cellConfigBlock(cell,_dataArray[indexPath.row], indexPath);
    }
    return cell;
}

#pragma mark UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(collectionView.bounds.size.width, collectionView.bounds.size
                      .height);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsZero;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

@end
