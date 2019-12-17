//
//  NSString+JW.m
//  Demo
//
//  Created by 刘君威 on 2019/4/16.
//  Copyright © 2019 liujunwei. All rights reserved.
//

#import "NSString+JW.h"

@implementation NSString (JW)

#pragma mark -JSON

// 转换成 JSON 字典
- (id)jw_jsonValue {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    if (data.length) {
        NSError *error = nil;
        id jsonValue = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        return jsonValue ? jsonValue : nil;
    }
    return nil;
}

// url 参数转换JSON成字典
- (id)jw_urlConvertJSON {
    NSString *jsonValue = [self stringByReplacingOccurrencesOfString:@"&" withString:@"\",\""];
    jsonValue = [jsonValue stringByReplacingOccurrencesOfString:@"=" withString:@"\":\""];
    jsonValue = [NSString stringWithFormat:@"%@%@%@",@"{\"",jsonValue,@"\"}"];
    
    return [jsonValue jw_jsonValue];
}

// 将 URL 参数转换成字典
- (NSDictionary *)jw_urlConvertDictionary {
    if (self.length) {
        NSString *parameterStr = [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSArray<NSString *> *paramArray = [parameterStr componentsSeparatedByString:@"&"];
        NSMutableDictionary *resultDict = [NSMutableDictionary dictionary];
        for (NSString *parameter in paramArray) {
            NSArray<NSString *> *array = [parameter componentsSeparatedByString:@"="];
            NSString *key = array.firstObject;
            NSString *valueStr = array.lastObject;
            id value = valueStr;
            if (([valueStr hasPrefix:@"{"] && [valueStr hasSuffix:@"}"]) ||
                ([valueStr hasPrefix:@"["] && [valueStr hasSuffix:@"]"])) {
                NSData *data = [valueStr dataUsingEncoding:NSUTF8StringEncoding];
                value = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            }
            resultDict[key] = value;
        }
        return [NSDictionary dictionaryWithDictionary:resultDict];
    }
    return nil;
}

#pragma mark - BOOL

// 是否包含指定字符串
- (BOOL)jw_contains:(NSString *)string {
    // rangeOfString: 在 self 中查找是否包含 string 这个字符串
    NSRange range = [self rangeOfString:string];
    
    return range.location != NSNotFound;
}

// 是否以某字符串结尾, 存在bug,如果在前面有搜索到相同的某字符串,尾部的就不会被搜索了
// caseInsensitive 不区分大小写
- (BOOL)jw_endWith:(NSString *)endString caseInsensitive:(BOOL)caseInsensitive {
    NSRange range;
    if (caseInsensitive) {
        // NSCaseInsensitiveSearch 不区分大小写
        range = [self rangeOfString:endString options:NSCaseInsensitiveSearch];
    } else {
        range = [self rangeOfString:endString];
    }
    
    if (range.location != NSNotFound && (range.location + range.length) == self.length) {
        return YES;
    }
    return NO;
}

// 判断字符串是否为空或者长度为0
- (BOOL)jw_nilOrEmpty {
    return (self == nil || self.length == 0 || [self isEqualToString:@""]);
}

// 验证邮箱格式
- (BOOL)jw_validEmail {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [predicate evaluateWithObject:self];
}

// 验证电话格式
- (BOOL)jw_validMobile {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES '^[0-9]{11}'"];
    return [predicate evaluateWithObject:self];
}

// 验证手机格式
- (BOOL)jw_validFixPhone {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES '^[0-9]{10,12}'"];
    return [predicate evaluateWithObject:self];
}

// 验证身份证格式
- (BOOL)jw_validIDCard {
    NSString *cardRegex = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",cardRegex];
    return [predicate evaluateWithObject:self];
}

// 是否全部都是数字
- (BOOL)jw_allNumbers {
    if (self.length < 1) {
        return NO;
    }
    
    for (int i = 0; i < self.length; ++i) {
        if (!isnumber([self characterAtIndex:i])) {
            return NO;
        }
    }
    return YES;
}

// 是否全部都是数字,且可以包含小数点,如果有一个以上小数点就无效了(..)
- (BOOL)jw_allDecimalDigit {
    if (self.length < 1) {
        return NO;
    }
    // 筛选出0-9,剩下的长度如果为0或者.  说明没有其他类型的字符,返回yes
    NSString *tmp = [self stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if (tmp.length == 0 || [tmp isEqualToString:@"."]) {
        return YES;
    }
    return NO;
}

// 是否包含中文,英文,数字,下划线
- (BOOL)jw_validContainChiEng {
    NSString * regex = @"^[\u4e00-\u9fa5A-Za-z0-9_]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:self];
    
    return isMatch;
}
// 是否包英文,数字
- (BOOL)jw_validContainNumEng {
    NSString * regex = @"^[A-Za-z0-9]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:self];
    
    return isMatch;
}

// 是否包含中文
- (BOOL)jw_containChinese {
    for (int i = 0; i < self.length; ++i) {
        NSString *temp = [self substringWithRange:NSMakeRange(i, 1)];
        const char *u8Temp = [temp UTF8String];
        if (u8Temp != nil && 3 == strlen(u8Temp)) {
            return YES;
        }
    }
    return NO;
}

// 是否为图片链接
- (BOOL)jw_imageURLString {
    if ([self hasSuffix:@".png"] || [self hasSuffix:@".jpg"] || [self hasSuffix:@".jpeg"]) {
        return YES;
    }
     return NO;
}

// 是否为JavaScript文件链接
- (BOOL)jw_javascriptURLString {
    NSString *hostStr = [self componentsSeparatedByString:@"?"].firstObject;
    if ([hostStr hasSuffix:@".js"] && ![hostStr hasSuffix:@"indexPageFile.js"]) {
        return YES;
    }
    return NO;
}

// 是否为URL链接
- (BOOL)jw_urlString {
    if ([self jw_contains:@"http://"] || [self jw_contains:@"https://"]) {
        return YES;
    }
    return NO;
}

// 是否为gif图片链接
- (BOOL)jw_gifImageUrl {
    if ([self jw_urlString]) {
        if ([self jw_contains:@".gif"] ||  [self jw_contains:@".GIF"]) {
            return YES;
        }
    }
    return NO;
}

// 是否包含emoji表情
- (BOOL)jw_containsEmoji {
    __block BOOL result = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        if ([substring isEmoji]) {
            *stop = YES;
            result = YES;
        }
    }];
    return result;
}

- (BOOL)isEmoji {
    const unichar high = [self characterAtIndex:0];
    
    if (0xd800 <= high && high <= 0xdbff) {
        const unichar low = [self characterAtIndex:1];
        const int codepoint = ((high - 0xd800) * 0x400) + (low - 0xdc00) + 0x10000;
        
        return (0x1d000 <= codepoint && codepoint <= 0x1f77f);
        
    } else {
        return (0x2100 <= high && high <= 0x27bf);
    }
}

@end
