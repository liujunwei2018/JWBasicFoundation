//
//  NSArray+JW.h
//  Demo
//
//  Created by 刘君威 on 2019/4/12.
//  Copyright © 2019 liujunwei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (JW)

#pragma mark - safe
- (id)jw_safeObjectAtIndex:(NSUInteger)index;

- (NSInteger)jw_safeIndexOfObject:(id)object;

- (id)jw_safeSubarrayWithRange:(NSRange)range;

#pragma mark - JSON转换

/// 数组转JSON
- (NSString *)jw_jsonValue;
/// 数组成转换成JSON NSdata
- (id)jw_jsonData;

@end

NS_ASSUME_NONNULL_END
