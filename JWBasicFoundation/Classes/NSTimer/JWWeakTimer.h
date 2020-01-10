//
//  JWWeakTimer.h
//  JWBasicFoundation_Example
//
//  Created by 刘君威 on 2020/1/10.
//  Copyright © 2020 liujunwei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JWWeakTimer : NSObject

/**
 * 避免计时器循环引用self;
 * 参照NSTimer穿参
 */
+ (NSTimer *)jw_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      target:(id)aTarget
                                    selector:(SEL)aSelector
                                    userInfo:(id)userInfo
                                     repeats:(BOOL)repeats;

@end

NS_ASSUME_NONNULL_END
