//
//  JWWeakTimer.h
//  JWBasicFoundation_Example
//
//  Created by 刘君威 on 2020/1/10.
//  Copyright © 2020 liujunwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JWWeakTimer : NSObject

/**
 * 避免计时器循环引用 self
 * 参照 NSTimer 传参
 */
+ (NSTimer *)jw_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      target:(id)aTarget
                                    selector:(SEL)aSelector
                                    userInfo:(id)userInfo
                                     repeats:(BOOL)repeats;

@end

