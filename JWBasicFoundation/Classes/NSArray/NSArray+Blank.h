//
//  NSArray+Black.h
//  信息采集平台
//
//  Created by 刘君威 on 2019/1/4.
//  Copyright © 2019 ljw. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (Blank)

/**
 判断数组是否为空
 @return nil、NULL、NSNull、count=0 都是YES   剩下为NO
 */
- (BOOL)isBlankArray;
@end

NS_ASSUME_NONNULL_END
