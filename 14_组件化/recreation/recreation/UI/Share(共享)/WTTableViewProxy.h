//
//  WTTableViewProxy.h
//  recreation
//
//  Created by mac on 2019/3/1.
//  Copyright © 2019年 WT. All rights reserved.
//

#import <UIKit/UIKit.h>

//-----1.3版本-添加tableView-----
// TableViewCell 配置和事件响应转发出去的block
typedef void(^WTTVConfigBlock)(UITableViewCell *cell, id cellData, NSIndexPath *indexPath);
typedef void(^WTTVActionBlock)(UITableViewCell *cell, id cellData, NSIndexPath *indexPath);


@interface WTTableViewProxy : NSObject

@property (nonatomic, strong) NSString *reuseIdentifier; /**< 重用标识符 */
@property (copy) WTTVConfigBlock cellConfigBlock;
// tableView中事件,就通过cellActionBlock回调出去
@property (nonatomic, copy) WTTVActionBlock cellActionBlock;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
                          configuration:(WTTVConfigBlock)cBlock
                                 action:(WTTVActionBlock)aBlock NS_DESIGNATED_INITIALIZER;

@end
