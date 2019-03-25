//
//  WTSegmentedControl.m
//  recreation
//
//  Created by 王涛 on 2019/3/19.
//  Copyright © 2019年 WT. All rights reserved.
//

#import "WTSegmentedControl.h"

//----------------------1.7版本-新增分段控制的view----------------------
// 添加内置的cell
@interface WTSegmentedControlCell : UICollectionViewCell

@property (strong, nonatomic) UILabel *titleLabel;
// 设置文字颜色
@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *highlightColor;

// 配置Segmented上cell的文字
- (void)configCellWithTitle:(NSString *)title selectedStatus:(BOOL)isSelected;

@end

@implementation WTSegmentedControlCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _titleLabel = [UILabel new];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:14.];
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}

// 配置Segmented上cell的文字及颜色
- (void)configCellWithTitle:(NSString *)title selectedStatus:(BOOL)isSelected {
    self.titleLabel.text = title;
    self.titleLabel.textColor = isSelected ? _highlightColor : _normalColor;
    self.titleLabel.font = isSelected ? [UIFont boldSystemFontOfSize:16.] : [UIFont systemFontOfSize:14.];
}

@end

@interface WTSegmentedControl () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, assign) CGFloat itemWidth;
@property (nonatomic, strong) NSArray *itemTitles;

@property (nonatomic, strong) UIView *lineView; // 黄线
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation WTSegmentedControl

- (instancetype)initWithFrame:(CGRect)frame itemWidth:(CGFloat)itemWidth itemTitles:(NSArray *)itemTitles {
    if (self = [super initWithFrame:frame]) {
        _itemWidth = itemWidth;
        _itemTitles = [NSArray arrayWithArray:itemTitles];
        //1.8版本 避免使用toolbar覆盖自己布局的子视图.先使用layoutIfNeeded
        [self layoutIfNeeded];
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    [self addSubview:self.collectionView];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    //----------------------1.8版本-黄线约束调整----------------------
    [self addSubview:self.lineView];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@10);
        make.bottom.equalTo(self);
        make.width.equalTo(@(self->_itemWidth-20));
        make.height.equalTo(@4);
    }];
    
    // 注册collection cell
    [_collectionView registerClass:[WTSegmentedControlCell class] forCellWithReuseIdentifier:NSStringFromClass([WTSegmentedControlCell class])];
    [_collectionView reloadData];
}

//----------------------1.8版本-实现方法----------------------
// 移动
- (void)didMoveTo:(CGFloat)index {
    //    NSLog(@"didMoveTo %f", index);
    [self updateLineViewIndicator:index];
    [self moveToPage:(int)index];
}

// 黄线的滑动
- (void)updateLineViewIndicator:(CGFloat)index {
    // 越界就不处理
    if (index <0 || index > _itemTitles.count-1) {
        return;
    }
    // 计算位置
//    CGRect oFrame = _lineView.frame;
//    oFrame.origin.x = index * _itemWidth + 10;
//    _lineView.frame = oFrame;
    
    //----------------------1.8版本-更新黄线约束----------------------
    // 更新约束
    [_lineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@(index * _itemWidth + 10));
    }];
    //---------------------------------end----------------------
}

//----------------------1.8版本-移动页面----------------------
// 移动页面
- (void)moveToPage:(NSInteger)index {
    _currentIndex = index;
    [_collectionView reloadData];
    [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}

#pragma mark properties 懒加载的方法
- (UIView *)lineView {
    if(!_lineView) {
//----------------------1.8 修改了创建方式----------------------
//        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _itemWidth, 4)];
        _lineView = [UIView new];
        _lineView.backgroundColor = [UIColor colorWithHexString:@"FCCA07" ];
        _lineView.layer.cornerRadius =  2.0;
    }
    return _lineView;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        // scrollDirection 滚动方向
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        // 关闭垂直和水平滚动条
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor clearColor];
        
        // 点击设备状态栏,返回顶部(多个会有冲突,其中一个需关闭)
        _collectionView.scrollsToTop = NO;
        // 子视图不会自动调整行为了
        [_collectionView setAutoresizesSubviews:NO];
        
    }
    return _collectionView;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    // 黄线的滑动
    //----------------------1.8 修改
//    [self updateLineViewIndicator:indexPath.item];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(segmentedControl:didSelectItemAtIndex:fromIndex:)]) {
        [self.delegate segmentedControl:self didSelectItemAtIndex:indexPath.item fromIndex:self.currentIndex];
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _itemTitles.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WTSegmentedControlCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([WTSegmentedControlCell class]) forIndexPath:indexPath];
    if (!cell) cell = [WTSegmentedControlCell new];
    NSString *itemTitle = _itemTitles[indexPath.item];
    
    // 文字颜色
    cell.normalColor = self.normalColor;
    cell.highlightColor = self.highlightColor;
    [cell configCellWithTitle:itemTitle selectedStatus:_currentIndex == indexPath.item];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(_itemWidth, self.bounds.size.height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
@end
