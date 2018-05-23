//
//  Video.m
//  001-XML解析
//
//  Created by mac on 2018/5/11.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Video.h"

@implementation Video

-(NSString *)time{
    int len = self.length.intValue;
    
    //时分秒
    return [NSString stringWithFormat:@"%02d:%02d:%02d",len/3600,(len % 3600)/60,(len % 60)];
}

-(instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if(self){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)videoWithDict:(NSDictionary *)dict{
    
    return [[self alloc]initWithDict:dict];
}

//重写description方法
-(NSString *)description{
    return [NSString stringWithFormat:@"<%@:%p>{videoId :%@,name : %@,length : %@ ,videoURL : %@,imageURL : %@,desc : %@,teacher : %@}",[self class],self,self.videoId,self.name,self.length,self.videoURL,self.imageURL,self.desc,self.teacher];
}
@end
