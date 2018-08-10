//
//  DSLImageViewMaker.h
//  DSL2
//
//  Created by sw on 2018/7/27.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "DSLViewMaker.h"

@interface DSLImageViewMaker : DSLViewMaker

DSLImageViewMaker *alloc_imageView(void);

#pragma mark - UIView
- (DSLImageViewMaker *(^)(CGRect))frame;
- (DSLImageViewMaker *(^)(UIColor *))backgroundColor;
- (DSLImageViewMaker *(^)(UIView *))addToSuperView;

#pragma mark - UIImageView
- (DSLImageViewMaker *(^)(UIImage *))image;
- (DSLImageViewMaker *(^)(UIImage *))highlightedImage;
- (DSLImageViewMaker *(^)(BOOL))userInteractionEnabled;

@end
