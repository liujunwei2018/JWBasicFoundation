//
//  NSArray+JW.m
//  Demo
//
//  Created by 刘君威 on 2019/4/12.
//  Copyright © 2019 liujunwei. All rights reserved.
//

#import "NSArray+JW.h"

@implementation NSArray (JW)

#pragma mark - safe

- (id)jw_safeObjectAtIndex:(NSUInteger)index {
    if (index < self.count) {
        return [self objectAtIndex:index];
    }
    return nil;
}

- (NSInteger)jw_safeIndexOfObject:(id)object {
    if (object) {
        return [self indexOfObject:object];
    }
    return NSNotFound;
}

- (id)jw_safeSubarrayWithRange:(NSRange)range {
    if ((range.location + range.length) <= self.count) {
        return [self subarrayWithRange:range];
    }
    return nil;
}

#pragma mark - JSON

/// 数组转JSON
- (NSString *)jw_jsonValue {
    NSData *data = [self jw_jsonData];
    if (data.length) {
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
}

/// 数组成转换成JSON NSdata
- (id)jw_jsonData {
    if (self) {
        return [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:nil];
    }
    return nil;
}
@end
