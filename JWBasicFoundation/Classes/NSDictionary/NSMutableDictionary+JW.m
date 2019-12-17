//
//  NSMutableDictionary+JW.m
//  Demo
//
//  Created by 刘君威 on 2019/4/15.
//  Copyright © 2019 liujunwei. All rights reserved.
//

#import "NSMutableDictionary+JW.h"

@implementation NSMutableDictionary (JW)

- (void)jw_safeSetObject:(id)anObject forKey:(id<NSCopying>)aKey {
    if (!aKey) {
        return;
    }
    if (!anObject) {
        [self removeObjectForKey:aKey];
        return;
    }
    
    [self setObject:anObject forKey:aKey];
}

- (void)jw_safeRemoveObjectForKey:(id<NSCopying>)aKey {
    if (aKey) {
        [self removeObjectForKey:aKey];
    }
}

- (void)jw_safeAppendDictionary:(NSDictionary *)dictionary {
    __weak typeof(self) weakSelf = self;
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf jw_safeSetObject:obj forKey:key];
    }];
}
@end
