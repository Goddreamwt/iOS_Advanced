//
//  HomeTableViewDefines.h
//  recreation
//
//  Created by wt on 2019/3/14.
//  Copyright © 2019年 WT. All rights reserved.
//

//1.4版本-添加头文件类,cell的标识符写成宏的形式
#ifndef HomeTableViewDefines_h
#define HomeTableViewDefines_h

// 可以通过valus去取到所有的标识符.
// 接口下发的时候, 只需要下发过来这个banner 和title, 就可以取到对应的cell.展示对应的cell.
//----------------------1.6版本-新增two, change的cell标识
#define HomeTableViewCellIdentifiers  @{@"banner": @"HomeBannerTableViewCell",\
@"title": @"HomeTitleTableViewCell",\
@"two": @"HomeTwoTableViewCell",\
@"change": @"HomeChangeTableViewCell"}

// 对应的高度, 也是可以通过banner和title取到的
#define HomeTableViewCellHeights @{@"banner": @(100),\
@"title": @(40),\
@"two": @(100),\
@"change": @(40)}

#endif /* HomeTableViewDefines_h */
