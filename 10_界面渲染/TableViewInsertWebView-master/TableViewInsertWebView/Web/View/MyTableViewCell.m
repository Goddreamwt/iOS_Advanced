//
//  MyTableViewCell.m
//  TableViewInsertWebView
//
//  Created by zhangyan on 2017/6/28.
//  Copyright © 2017年 zhangyan. All rights reserved.
//

#import "MyTableViewCell.h"
#import "WebModel.h"

@interface MyTableViewCell()<UIWebViewDelegate>

@property (nonatomic, strong)UIWebView *myWebView;

@end

@implementation MyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addSubview:self.myWebView];
    }
    return self;
}


- (void)setModel:(WebModel *)model
{
    _model = model;
    
    [self.myWebView loadRequest:model.uRLRequest];
}

#pragma mark- UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //获取到webview的高度
    CGFloat webViewHeight1 = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.scrollHeight"] floatValue];
    CGFloat webViewHeight2 = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"] floatValue];
    CGFloat webViewHeight3 = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.clientHeight"] floatValue];
    
    NSLog(@"webViewHeight1 == %f",webViewHeight1);
    NSLog(@"webViewHeight2 == %f",webViewHeight2);
    NSLog(@"webViewHeight3 == %f",webViewHeight3);
    
    
    webView.frame = CGRectMake(webView.frame.origin.x,webView.frame.origin.y, kScreenWidth, webViewHeight1);
    
    // 获取完毕之后以通知的形式，或者回调的形式通知tableView刷新
    if (self.model.webViewHeight != webViewHeight1) {
        self.model.webViewHeight = webViewHeight1;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"RefreshCell" object:nil];
    }
    
}

#pragma mark- set
- (UIWebView *)myWebView
{
    if (_myWebView == nil) {
        UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
        webView.scrollView.scrollEnabled = NO;
        webView.delegate = self;
        _myWebView = webView;
    }
    return _myWebView;
}




@end
