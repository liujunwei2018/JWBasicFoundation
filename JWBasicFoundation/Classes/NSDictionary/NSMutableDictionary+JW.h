//
//  NSMutableDictionary+JW.h
//  Demo
//
//  Created by 刘君威 on 2019/4/15.
//  Copyright © 2019 liujunwei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableDictionary (JW)

#pragma mark - Safe

- (void)jw_safeSetObject:(id)anObject forKey:(id<NSCopying>)aKey;
- (void)jw_safeRemoveObjectForKey:(id<NSCopying>)aKey;
- (void)jw_safeAppendDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
