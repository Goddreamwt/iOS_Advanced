//
//  HomeTableViewDefines.h
//  TZVideoDemo
//
//  Created by Dream on 2018/7/26.
//  Copyright © 2018年 TZ. All rights reserved.
//

//-----------------1.4 版本-添加头文件类,cell的标识符写成宏的形式-------------
#ifndef HomeTableViewDefines_h
#define HomeTableViewDefines_h

//----------------------1.6版本-新增two, change的cell标识--------------------
// 可以通过valus去取到所有的标识符.
// 接口下发的时候, 只需要下发过来这个banner 和title, 就可以取到对应的cell.展示对应的cell.
#define HomeTableViewCellIdentifiers  @{@"banner": @"HomeBannerTableViewCell",\
@"title": @"HomeTitleTableViewCell",\
@"two": @"HomeTwoTableViewCell",\
@"change": @"HomeChangeTableViewCell"}

// 对应的高度, 也是可以通过banner和title取到的
#define HomeTableViewCellHeights @{@"banner": @(150),\
@"title": @(40),\
@"two": @(100),\
@"change": @(40)}
//-------------------------------end-------------------------------

#endif /* HomeTableViewDefines_h */
//-------------------------------end-------------------------------

