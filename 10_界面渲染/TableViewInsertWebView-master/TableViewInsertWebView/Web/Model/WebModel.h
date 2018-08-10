//
//  WebModel.h
//  TableViewInsertWebView
//
//  Created by zhangyan on 2017/7/3.
//  Copyright © 2017年 zhangyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebModel : NSObject

/** 加载的webView内容 */
@property (nonatomic, copy)NSString * webStr;
@property (nonatomic, assign)CGFloat webViewHeight;

/** <#注释#> */
@property (nonatomic, strong)NSURLRequest * uRLRequest;

@end
