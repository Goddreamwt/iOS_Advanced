//
//  WebModel.m
//  TableViewInsertWebView
//
//  Created by zhangyan on 2017/7/3.
//  Copyright © 2017年 zhangyan. All rights reserved.
//

#import "WebModel.h"

@implementation WebModel

- (void)setWebStr:(NSString *)webStr
{
    _webStr = [webStr copy];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL fileURLWithPath:webStr]];
    self.uRLRequest = request;
    
}

@end
