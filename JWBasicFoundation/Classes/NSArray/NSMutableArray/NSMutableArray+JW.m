//
//  NSMutableArray+JW.m
//  Demo
//
//  Created by 刘君威 on 2019/4/12.
//  Copyright © 2019 liujunwei. All rights reserved.
//

#import "NSMutableArray+JW.h"

@implementation NSMutableArray (JW)

#pragma mark - safe
#pragma mark Add
- (void)jw_safeAddObject:(id)object {
    if (object) {
        [self addObject:object];
    }
}

- (void)jw_safeAddObjectsFromArray:(NSArray *)array {
    if (array.count) {
        [self addObjectsFromArray:array];
    }
}

- (BOOL)jw_addObject:(id)object {
    if (object) {
        [self addObject:object];
        return YES;
    }
    return NO;
}

#pragma mark Insert
- (void)jw_safeInsertObject:(id)object atIndex:(NSUInteger)index {
    if (object && index <= self.count) {
        [self insertObject:object atIndex:index];
    }
}
- (void)jw_safeInsertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes {
    if (objects.count && indexes) {
        [self insertObjects:objects atIndexes:indexes];
    }
}

#pragma mark remove
- (void)jw_safeRemoveObject:(id)object {
    if (object && [self containsObject:object]) {
        [self removeObject:object];
    }
}

- (void)jw_safeRemoveLastObject {
    if (self.count) {
        [self removeLastObject];
    }
}

- (void)jw_safeRemoveObject:(id)object inRange:(NSRange)range {
    if (object && range.location + range.length < self.count) {
        [self removeObject:object inRange:range];
    }
}

- (void)jw_safeRemoveObjectAtIndex:(NSUInteger)index {
    if (index < self.count) {
        [self removeObjectAtIndex:index];
    }
}

- (void)jw_safeRemoveObjectIdenticalTo:(id)object inRange:(NSRange)range {
    if (object && range.location + range.length < self.count) {
        [self jw_safeRemoveObjectIdenticalTo:object inRange:range];
    }
}

- (void)jw_safeRemoveObjectsAtIndexes:(NSIndexSet *)indexes {
    if (indexes) {
        [self jw_safeRemoveObjectsAtIndexes:indexes];
    }
}

#pragma mark Replace
- (void)jw_safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)object {
    if (object && index < self.count) {
        [self replaceObjectAtIndex:index withObject:object];
    }
}

- (void)jw_safeReplaceObjectsAtIndexex:(NSIndexSet *)indexes withObjects:(NSArray *)objects {
    if (objects.count && indexes) {
        [self replaceObjectsAtIndexes:indexes withObjects:objects];
    }
}

@end
