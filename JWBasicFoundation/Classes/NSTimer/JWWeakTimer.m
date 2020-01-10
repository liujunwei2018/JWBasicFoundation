//
//  JWWeakTimer.m
//  JWBasicFoundation_Example
//
//  Created by 刘君威 on 2020/1/10.
//  Copyright © 2020 liujunwei. All rights reserved.
//

#import "JWWeakTimer.h"

@interface JWWeakTimer ()

@property (nonatomic, assign) SEL selector;

@property (nonatomic, weak) NSTimer *timer;

@property (nonatomic, weak) id target;

@end

@implementation JWWeakTimer

+ (NSTimer *)jw_scheduledTimerWithTimeInterval:(NSTimeInterval)interval target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)repeats {
    
    JWWeakTimer *weakTimer = [[JWWeakTimer alloc] init];
    weakTimer.target = aTarget;
    weakTimer.selector = aSelector;
    weakTimer.timer = [NSTimer scheduledTimerWithTimeInterval:interval target:weakTimer selector:@selector(fire:) userInfo:userInfo repeats:repeats];
    
    return weakTimer.timer;
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
- (void)fire:(NSTimer *)timer
{
    if ([self.target respondsToSelector:self.selector]) {
        [self.target performSelector:self.selector withObject:timer.userInfo];
    } else {
        [self.timer invalidate];
    }
}
#pragma clang diagnostic pop

@end
