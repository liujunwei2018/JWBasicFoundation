//
//  NSDateFormatter+LW.m
//  Demo
//
//  Created by 刘君威 on 2019/4/15.
//  Copyright © 2019 liujunwei. All rights reserved.
//

#import "NSDateFormatter+JW.h"

static NSMutableDictionary *formatters = nil;

@implementation NSDateFormatter (JW)

+ (NSDateFormatter *)jw_dateFormatterWithFormat:(NSString *)format {
    return [self jw_dateFormatterWithKey:[NSString stringWithFormat:@"<%@>", format] configBlock:^(NSDateFormatter * _Nonnull formmater) {
        if (formatters) {
            [formmater setDateFormat:format];
        }
    }];
}

// key 唯一标识
// block 配置formmater的格式
+ (NSDateFormatter *)jw_dateFormatterWithKey:(NSString *)key configBlock:(JWDateFormatterConfigBlock)block {
    NSString *strKey = nil;
    if (!key) {
        strKey = @"defaultFormatter";
    } else {
        strKey = [key copy];
    }
    
    // 在iOS7之后 NSDateFormatter 是线程安全的
    NSDateFormatter *dateFormatter = [[self formatters] objectForKey:strKey];
    if (!dateFormatter) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [[self formatters] setObject:dateFormatter forKey:strKey];
        if (block) {
            block(dateFormatter);  // 提供给外界配置
        }
        return dateFormatter;
    }
    
    return dateFormatter;
    
}

// 缓存字典
+ (NSMutableDictionary *)formatters {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!formatters) {
            formatters = [[NSMutableDictionary alloc] init];
        }
    });
    return formatters;
}


@end
