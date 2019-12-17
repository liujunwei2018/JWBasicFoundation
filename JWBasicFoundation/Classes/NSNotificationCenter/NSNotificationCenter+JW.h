//
//  NSNotificationCenter+JW.h
//  Demo
//
//  Created by 刘君威 on 2019/4/16.
//  Copyright © 2019 liujunwei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNotificationCenter (JW)

- (void)jw_safeAddObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject;

@end

NS_ASSUME_NONNULL_END
