//
//  DSLImageViewMaker.m
//  DSL2
//
//  Created by sw on 2018/7/27.
//  Copyright © 2018年 ws. All rights reserved.
//

#import "DSLImageViewMaker.h"
#define weak_Self __weak typeof(self) weakSelf = self
#define strong_Self __strong typeof((weakSelf)) strongSelf = (weakSelf)

@interface DSLImageViewMaker()
@property (nonatomic, strong) UIImageView *imageView;
@end

DSLImageViewMaker *alloc_imageView() {
    return [DSLImageViewMaker new];
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"
@implementation DSLImageViewMaker
#pragma clang diagnostic pop


- (instancetype)init {
    if (self = [super init]) {
        _imageView = [UIImageView new];
    }
    
    return self;
}

#pragma mark - Getter
- (DSLImageViewMaker *(^)(UIImage *))image {
    __weak typeof(self) weakSelf = self;
    return ^DSLImageViewMaker *(UIImage *image) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.imageView.image = image;
        return strongSelf;
    };
}

- (DSLImageViewMaker *(^)(UIImage *))highlightedImage {
    weak_Self;
    return ^DSLImageViewMaker *(UIImage *highlightedImage) {
        strong_Self;
        strongSelf.imageView.image = highlightedImage;
        return strongSelf;
    };
}

- (DSLImageViewMaker *(^)(BOOL))userInteractionEnabled {
    weak_Self;
    return ^DSLImageViewMaker *(BOOL userInteractionEnabled) {
        strong_Self;
        strongSelf.imageView.userInteractionEnabled = userInteractionEnabled;
        return strongSelf;
    };
}

- (id)view {
    return _imageView;
}
@end
