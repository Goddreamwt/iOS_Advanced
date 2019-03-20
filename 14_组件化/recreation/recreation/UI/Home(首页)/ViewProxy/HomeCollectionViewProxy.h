//
//  HomeCollectionViewProxy.h
//  recreation
//
//  Created by mac on 2019/3/1.
//  Copyright © 2019年 WT. All rights reserved.
//

#import "WTCollectionViewProxy.h"
#import "WTSegmentedControl.h"

@interface HomeCollectionViewProxy : WTCollectionViewProxy

//----------------------1.7版本-添加segmentedControl属性----------------------
// 提供给外界的segmentedControl
@property (nonatomic, strong) WTSegmentedControl *segmentedControl;
//---------------------------------end-------------------------------------

@end
