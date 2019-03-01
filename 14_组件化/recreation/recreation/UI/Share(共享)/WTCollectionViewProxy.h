//
//  WTCollectionViewProxy.h
//  recreation
//
//  Created by mac on 2019/2/28.
//  Copyright © 2019年 WT. All rights reserved.
//

#import <UIKit/UIKit.h>

// 配置和事件响应转发出去的block
typedef void (^WTCVConfigBlock)(UICollectionViewCell *cell, id cellData, NSIndexPath *indexPath);
typedef void(^WTCVActionBlock)(UICollectionViewCell *cell, id cellData, NSIndexPath *indexPath);

@interface WTCollectionViewProxy : NSObject

@property (nonatomic, strong) NSString *reuseIdentifier; /**<重用标识符 */
@property (nonatomic, copy) WTCVConfigBlock cellConfigBlock;
// colloctionview中有事件,就通过cellActionBlock回调出去
@property (nonatomic, copy) WTCVActionBlock cellActionBlock;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UICollectionView *collectionView;

/*
 NS_UNAVAILABLE 调用这个方法初始化就会报错.
 NS_DESIGNATED_INITIALIZER 子类的在调自己初始化方法时,在内部必须调用父类这方法,否则报警告.
 这两个宏一般配合起来使用,告诉别人不要用init方法初始化,使用自定义的构造方法初始化
 */
- (instancetype)init NS_UNAVAILABLE;

// 加action的原因是,左右滚动是Collection来管,具体cell的点击由tableView来做,所以也可以在初始化方法里面, 添加action这样的block交由外界来处理
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
                          configuration:(WTCVConfigBlock)cBlock action:(WTCVActionBlock)aBlock NS_DESIGNATED_INITIALIZER;

@end
