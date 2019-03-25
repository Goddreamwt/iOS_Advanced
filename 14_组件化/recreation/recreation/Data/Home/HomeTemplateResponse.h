//
//  HomeTemplateResponse.h
//
//  Created by Dream on 2018/7/31.
//  Copyright © 2018年 TZ. All rights reserved.
//

#import "WTResponse.h"

@protocol HomeTemplateData
@end

//----------------------1.6版本-新增数据模型--------------------
// templateData数组里面对应的字符串
@interface HomeTemplateData : JSONModel

@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subTitle;

@end

@protocol HomeTemplateItem
@end

// data数组里面对应的字符串和数组
@interface HomeTemplateItem : JSONModel

@property (nonatomic, strong) NSString *templateName;
@property (nonatomic, strong) NSArray <HomeTemplateData>*templateData;

@end

// 返回数据.json里面对应的数组
@interface HomeTemplateResponse : WTResponse

@property (nonatomic, strong) NSArray <HomeTemplateItem> *data;

@end
//--------------------------end-----------------------------
