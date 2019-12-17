//
//  NSDictionary+JW.h
//  Demo
//
//  Created by 刘君威 on 2019/4/15.
//  Copyright © 2019 liujunwei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (JW)

#pragma mark - Json
// 转换成Json字符串
- (NSString *)jw_jsonString;

// 转成key=value&key=value
- (NSString *)jw_parameterString;

// 转换成json NSData
- (NSData *)jw_jsonData;

#pragma mark - Safe
- (id)jw_safeObjectForKey:(id<NSCopying>)aKey;
@end

NS_ASSUME_NONNULL_END
