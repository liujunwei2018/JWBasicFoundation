//
//  NSDate+JW.h
//  Demo
//
//  Created by 刘君威 on 2019/4/15.
//  Copyright © 2019 liujunwei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (JW)

// 当前时间 yyyy-MM-dd hh:mm:ss
+ (NSString *)jw_nowDateLongString;

// 当前时间 yyyy-MM-dd
+ (NSString *)jw_nowDateShortString;

// 当前时间是否在这两个时间之间
+ (BOOL)jw_isTodayInRange:(NSString *)beginDateInterVal and:(NSString *)endDateInterVal;

// 根据时间戳 时间轴显示
+ (NSString *)jw_converDateIntervalToStringWith:(NSString *)interVal;
+ (NSString *)jw_converDateIntervalToSimpleStringWith:(NSString *)interVal;

+ (NSCalendar *)jw_currentCalendar;

@property (nonatomic, copy, readonly) NSString *shortString;
@property (nonatomic, copy, readonly) NSString *shortDateString;
@property (nonatomic, copy, readonly) NSString *shortTimeString;
@property (nonatomic, copy, readonly) NSString *mediumString;
@property (nonatomic, copy, readonly) NSString *mediumDateString;
@property (nonatomic, copy, readonly) NSString *mediumTimeString;
@property (nonatomic, copy, readonly) NSString *longString;
@property (nonatomic, copy, readonly) NSString *longDateString;
@property (nonatomic, copy, readonly) NSString *longTimeString;

@property (nonatomic, assign, readonly) NSInteger neatrestHour;
@property (nonatomic, assign, readonly) NSInteger hour;
@property (nonatomic, assign, readonly) NSInteger minute;
@property (nonatomic, assign, readonly) NSInteger seconds;
@property (nonatomic, assign, readonly) NSInteger day;
@property (nonatomic, assign, readonly) NSInteger month;
@property (nonatomic, assign, readonly) NSInteger weekOfMonth;
@property (nonatomic, assign, readonly) NSInteger weekOfYear;
@property (nonatomic, assign, readonly) NSInteger weekday;
@property (nonatomic, assign, readonly) NSInteger nthWeekday;
@property (nonatomic, assign, readonly) NSInteger year;
@property (nonatomic, assign, readonly) NSInteger numbersOfDaysInThisMonth;

@end

NS_ASSUME_NONNULL_END
