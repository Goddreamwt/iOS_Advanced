//
//  DSLHeader.h
//  DSL
//
//  Created by sw on 2018/7/27.
//  Copyright © 2018年 ws. All rights reserved.
//

#ifndef DSLHeader_h
#define DSLHeader_h

#define weak_Self __weak typeof(self) weakSelf = self
#define strong_Self __strong typeof((weakSelf)) strongSelf = (weakSelf)

#endif /* DSLHeader_h */
