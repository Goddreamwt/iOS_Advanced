//
//  WTTableViewCell.m
//  recreation
//
//  Created by 王涛 on 2019/3/14.
//  Copyright © 2019年 WT. All rights reserved.
//

#import "WTTableViewCell.h"

//1.4添加基类cell
@implementation WTTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
