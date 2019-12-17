//
//  NSDateFormatter+JW.h
//  Demo
//
//  Created by 刘君威 on 2019/4/15.
//  Copyright © 2019 liujunwei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^JWDateFormatterConfigBlock)(NSDateFormatter *formmater);

@interface NSDateFormatter (JW)

+ (NSDateFormatter *)jw_dateFormatterWithFormat:(NSString *)format;

// key 唯一标识
// block 配置formmater的格式
+ (NSDateFormatter *)jw_dateFormatterWithKey:(NSString *)key configBlock:(JWDateFormatterConfigBlock)block;
@end

NS_ASSUME_NONNULL_END
