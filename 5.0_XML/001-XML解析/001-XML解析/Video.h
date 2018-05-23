//
//  Video.h
//  001-XML解析
//
//  Created by mac on 2018/5/11.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Video : NSObject

/* id */
@property(strong,nonatomic)NSNumber * videoId;
@property(copy,nonatomic)NSString * name;
@property(strong,nonatomic)NSNumber * length;
@property(copy,nonatomic)NSString * videoURL;
@property(copy,nonatomic)NSString * imageURL;
@property(copy,nonatomic)NSString * desc;
@property(copy,nonatomic)NSString * teacher;

@property(nonatomic,readonly)NSString * time;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)videoWithDict:(NSDictionary *)dict;

@end
