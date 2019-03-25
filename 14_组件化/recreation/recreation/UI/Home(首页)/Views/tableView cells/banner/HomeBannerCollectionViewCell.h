//
//  HomeBannerCollectionViewCell.h
//  TZVideoDemo
//
//  Created by Dream on 2018/8/7.
//  Copyright © 2018年 TZ. All rights reserved.
//

#import <UIKit/UIKit.h>

//----------------------1.9版本-轮播器cell样式, 加了数据传递的方法----------------------
@interface HomeBannerCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (void)configWithData:(id)data; /**< 轮播器配置数据 */
@end
//----------------------------end------------------------------
