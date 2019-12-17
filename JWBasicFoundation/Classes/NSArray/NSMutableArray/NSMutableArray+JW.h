//
//  NSMutableArray+JW.h
//  Demo
//
//  Created by 刘君威 on 2019/4/12.
//  Copyright © 2019 liujunwei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (JW)

#pragma mark - safe
#pragma mark Add
- (void)jw_safeAddObject:(id)object;
- (void)jw_safeAddObjectsFromArray:(NSArray *)array;

- (BOOL)jw_addObject:(id)object;

#pragma mark Insert
- (void)jw_safeInsertObject:(id)object atIndex:(NSUInteger)index;
- (void)jw_safeInsertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes;

#pragma mark remove
- (void)jw_safeRemoveObject:(id)object;
- (void)jw_safeRemoveLastObject;
- (void)jw_safeRemoveObject:(id)object inRange:(NSRange)range;
- (void)jw_safeRemoveObjectAtIndex:(NSUInteger)index;
// 删除重复的object
- (void)jw_safeRemoveObjectIdenticalTo:(id)object inRange:(NSRange)range;
- (void)jw_safeRemoveObjectsAtIndexes:(NSIndexSet *)indexes;

#pragma mark Replace
- (void)jw_safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)object;
- (void)jw_safeReplaceObjectsAtIndexex:(NSIndexSet *)indexes withObjects:(NSArray *)objects;


@end

NS_ASSUME_NONNULL_END
