//
//  HomeBannerCollectionViewCell.m
//  TZVideoDemo
//
//  Created by Dream on 2018/8/7.
//  Copyright © 2018年 TZ. All rights reserved.
//

//----------------------1.9版本-轮播器cell样式,实现了数据传递的方法----------------------
#import "HomeBannerCollectionViewCell.h"
#import "HomeTemplateResponse.h"
#import "UIImageView+AFNetworking.h"

@implementation HomeBannerCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

// 数据给轮播器的cell来进行显示
- (void)configWithData:(id)data {
    if ([data isKindOfClass:[HomeTemplateData class]]) {
        HomeTemplateData *item = (HomeTemplateData *)data;
        self.titleLabel.text = item.title;
        self.subTitleLabel.text = item.subTitle;
        [self.imageView setImageWithURL:[NSURL URLWithString:item.img]];
    }
}

@end
//----------------------------end------------------------------
