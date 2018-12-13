//
//  NetworkLayer.h
//  NetworkLayer
//
//  Created by mac on 2018/12/13.
//  Copyright © 2018年 WT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkLayer : NSObject

//举例而已
- (void) get:(NSString *)username password:(NSString *)password;

- (void) post:(NSString *)username password:(NSString *)password;

@end
