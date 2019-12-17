//
//  NSNotificationCenter+JW.m
//  Demo
//
//  Created by 刘君威 on 2019/4/16.
//  Copyright © 2019 liujunwei. All rights reserved.
//

#import "NSNotificationCenter+JW.h"

@implementation NSNotificationCenter (JW)

- (void)jw_safeAddObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject {
    [self removeObserver:observer name:aName object:anObject];
    [self addObserver:observer selector:aSelector name:aName object:anObject];
}

@end
