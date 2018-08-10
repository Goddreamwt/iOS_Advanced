//
//  DSLViewMaker.h
//  DSL
//
//  Created by sw on 2018/7/26.
//  Copyright © 2018年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DSLViewMaker : NSObject
DSLViewMaker *alloc_view(void);

- (DSLViewMaker *(^)(CGRect))frame;
- (DSLViewMaker *(^)(UIColor *))backgroundColor;
- (DSLViewMaker *(^)(UIView *))addToSuperView;
- (id)view;

@end
