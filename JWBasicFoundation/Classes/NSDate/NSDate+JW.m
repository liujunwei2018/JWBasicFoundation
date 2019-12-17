//
//  NSDate+JW.m
//  Demo
//
//  Created by 刘君威 on 2019/4/15.
//  Copyright © 2019 liujunwei. All rights reserved.
//

#import "NSDate+JW.h"
#import "NSDateFormatter+JW.h"

static NSInteger const kJW_MINUTE = 60;
static NSInteger const kJW_HOUR = 3600;
static NSInteger const kJW_DAY = 86400;
static NSInteger const kJW_WEEK = 604800;
static NSInteger const kJW_YEAR = 31556926;

static const unsigned componentFlags = (NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay |  NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal);

@implementation NSDate (JW)

+ (NSString *)jw_nowDateLongString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    return [formatter stringFromDate:[NSDate date]];
}

+ (NSString *)jw_nowDateShortString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    return [formatter stringFromDate:[NSDate date]];
}

+ (BOOL)jw_isTodayInRange:(NSString *)beginDateInterVal and:(NSString *)endDateInterVal {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *todayDate = [NSDate date];
    NSDate *beginDate = [NSDate dateWithTimeIntervalSince1970:[beginDateInterVal longLongValue] / 1000];
    NSDate *endDate = [NSDate dateWithTimeIntervalSince1970:[endDateInterVal longLongValue] / 1000];
    if (!beginDate || !endDate) {
        return NO;
    }
    /// 日期比较
    //  laterDate:   返回较晚的那个时间
    //  earlierDate: 返回较早的那个时间
    if ([[todayDate laterDate:beginDate] isEqualToDate:todayDate] && [[todayDate earlierDate:endDate] isEqualToDate:todayDate]) {
        return YES;
    }
    
    return NO;
}

+ (NSString *)jw_converDateIntervalToStringWith:(NSString *)interVal {
    time_t statusCreateAt_t;
    NSString *timestamp = nil;
    time_t now;
    time(&now);
    
    statusCreateAt_t = (time_t)[interVal longLongValue];
    
    struct tm *nowtime;
    nowtime = localtime(&now);
    uint32_t thour = nowtime->tm_hour;
    
    localtime(&statusCreateAt_t);
    
    int distance = (int)difftime(now, statusCreateAt_t);
    if (distance < 0) {
        distance = 0;
    }
    
    if (distance < 30) {
        timestamp = @"刚刚";
    } else if (distance < 60) {
        timestamp = @"30秒前";
    } else if (distance < 60 * 60) { // 小于一小时
        distance = distance / 60;
        if (distance == 0) {
            distance = 1;
        }
        timestamp = [NSString stringWithFormat:@"%d分钟前", distance];
    } else if (distance < (60 * 60 * (thour))) { // 大于一小时,但是在今日内
        timestamp = [NSString stringWithFormat:@"%d小时前",distance / 60 / 60];
    } else {
        NSDate *date_now = [NSDate dateWithTimeIntervalSince1970:now];
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:statusCreateAt_t];
        NSInteger dateYear = [date year];
        NSInteger nowYear = [date_now year];
        
        if (dateYear == nowYear) {
            NSDateFormatter *dateFormatter = [NSDateFormatter jw_dateFormatterWithFormat:@"MM-dd HH:mm"];
            timestamp = [dateFormatter stringFromDate:date];
        } else {
            NSDateFormatter *dateFormatter = [NSDateFormatter jw_dateFormatterWithFormat:@"yyyy-MM-dd HH:mm"];
            timestamp = [dateFormatter stringFromDate:date];
        }
    }
    
    return timestamp;
}

// 与上一个方法相比只是返回的格式变短,只有日期部分
+ (NSString *)jw_converDateIntervalToSimpleStringWith:(NSString *)interVal {
    time_t statusCreateAt_t;
    NSString *timestamp = nil;
    time_t now;
    time(&now);
    
    statusCreateAt_t = (time_t)[interVal longLongValue];
    
    struct tm *nowtime;
    nowtime = localtime(&now);
    uint32_t thour = nowtime->tm_hour;
    
    localtime(&statusCreateAt_t);
    
    int distance = (int)difftime(now, statusCreateAt_t);
    if (distance < 0) {
        distance = 0;
    }
    
    if (distance < 30) {
        timestamp = @"刚刚";
    } else if (distance < 60) {
        timestamp = @"30秒前";
    } else if (distance < 60 * 60) { // 小于一小时
        distance = distance / 60;
        if (distance == 0) {
            distance = 1;
        }
        timestamp = [NSString stringWithFormat:@"%d分钟前", distance];
    } else if (distance < (60 * 60 * (thour))) { // 大于一小时,但是在今日内
        timestamp = [NSString stringWithFormat:@"%d小时前",distance / 60 / 60];
    } else {
        NSDate *date_now = [NSDate dateWithTimeIntervalSince1970:now];
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:statusCreateAt_t];
        NSInteger dateYear = [date year];
        NSInteger nowYear = [date_now year];
        
        if (dateYear == nowYear) {
            NSDateFormatter *dateFormatter = [NSDateFormatter jw_dateFormatterWithFormat:@"MM-dd"];
            timestamp = [dateFormatter stringFromDate:date];
        } else {
            NSDateFormatter *dateFormatter = [NSDateFormatter jw_dateFormatterWithFormat:@"yyyy-MM-dd"];
            timestamp = [dateFormatter stringFromDate:date];
        }
    }
    
    return timestamp;
}

+ (NSCalendar *)jw_currentCalendar {
    static NSCalendar *sharedCalendar = nil;
    if (!sharedCalendar) {
        sharedCalendar = [NSCalendar autoupdatingCurrentCalendar];
    }
    return sharedCalendar;
}

#pragma mark -

- (NSString *)jw_stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle {
    NSDateFormatter *formatter = [NSDateFormatter jw_dateFormatterWithFormat:@""];
    formatter.dateStyle = dateStyle;
    formatter.timeStyle = timeStyle;
    
    return [formatter stringFromDate:self];
}

#pragma mark - getter

- (NSString *)shortString {
    return [self jw_stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *)shortTimeString {
    return [self jw_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *)shortDateString {
    return [self jw_stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle];
}

- (NSString *)mediumString {
    return [self jw_stringWithDateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterMediumStyle];
}

- (NSString *)mediumTimeString
{
    return [self jw_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterMediumStyle ];
}

- (NSString *)mediumDateString
{
    return [self jw_stringWithDateStyle:NSDateFormatterMediumStyle  timeStyle:NSDateFormatterNoStyle];
}

- (NSString *)longString
{
    return [self jw_stringWithDateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterLongStyle];
}

- (NSString *)longTimeString
{
    return [self jw_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterLongStyle];
}

- (NSString *)longDateString
{
    return [self jw_stringWithDateStyle:NSDateFormatterLongStyle  timeStyle:NSDateFormatterNoStyle];
}

- (NSInteger)neatrestHour
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + kJW_MINUTE * 30;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    NSDateComponents *components = [[NSDate jw_currentCalendar] components:NSCalendarUnitHour fromDate:newDate];
    return components.hour;
}

- (NSInteger)hour
{
    NSDateComponents *components = [[NSDate jw_currentCalendar] components:componentFlags fromDate:self];
    return components.hour;
}

- (NSInteger)minute
{
    NSDateComponents *components = [[NSDate jw_currentCalendar] components:componentFlags fromDate:self];
    return components.minute;
}

- (NSInteger)seconds
{
    NSDateComponents *components = [[NSDate jw_currentCalendar] components:componentFlags fromDate:self];
    return components.second;
}

- (NSInteger)day
{
    NSDateComponents *components = [[NSDate jw_currentCalendar] components:componentFlags fromDate:self];
    return components.day;
}

- (NSInteger)month
{
    NSDateComponents *components = [[NSDate jw_currentCalendar] components:componentFlags fromDate:self];
    return components.month;
}

- (NSInteger)weekOfMonth
{
    NSDateComponents *components = [[NSDate jw_currentCalendar] components:componentFlags fromDate:self];
    return components.weekOfMonth;
}

- (NSInteger)weekOfYear
{
    NSDateComponents *components = [[NSDate jw_currentCalendar] components:componentFlags fromDate:self];
    return components.weekOfYear;
}

- (NSInteger)weekday
{
    NSDateComponents *components = [[NSDate jw_currentCalendar] components:componentFlags fromDate:self];
    return components.weekday;
}

- (NSInteger)nthWeekday // e.g. 2nd Tuesday of the month is 2
{
    NSDateComponents *components = [[NSDate jw_currentCalendar] components:componentFlags fromDate:self];
    return components.weekdayOrdinal;
}

- (NSInteger)numbersOfDaysInThisMonth
{
    NSRange range = [[NSDate jw_currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate date]];
    return range.length;
}

- (NSInteger)year
{
    NSDateComponents *components = [[NSDate jw_currentCalendar] components:componentFlags fromDate:self];
    return components.year;
}
@end
