//
//  NSDictionary+JW.m
//  Demo
//
//  Created by 刘君威 on 2019/4/15.
//  Copyright © 2019 liujunwei. All rights reserved.
//

#import "NSDictionary+JW.h"

@implementation NSDictionary (JW)

#pragma mark - Json

// 转换成Json字符串
- (NSString *)jw_jsonString {
    if (self) {
        NSData *data = [self jw_jsonData];
        if (data.length) {
            return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        }
    }
    return nil;
}

// 转成key=value&key=value
- (NSString *)jw_parameterString {
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSString *key in [self allKeys]) {
        NSString *content = [NSString stringWithFormat:@"%@=%@",key, [self jw_safeObjectForKey:key]];
        [tempArray addObject:content];
    }
    // 将array转换为string, & 为分隔符
    NSString *resultStr = [tempArray componentsJoinedByString:@"&"];
    resultStr = [NSString stringWithFormat:@"%@\n",resultStr];
    
    return resultStr;
}

// 转换成json NSData
- (NSData *)jw_jsonData {
    if (self) {
        return [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    }
    return nil;
}

#pragma mark - Safe

- (id)jw_safeObjectForKey:(id<NSCopying>)aKey {
    if (aKey) {
        return [self objectForKey:aKey];
    }
    return nil;
}
@end
