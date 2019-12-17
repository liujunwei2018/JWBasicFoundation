//
//  NSString+JW.h
//  Demo
//
//  Created by 刘君威 on 2019/4/16.
//  Copyright © 2019 liujunwei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (JW)

#pragma mark -JSON

// 转换成 JSON 字典
- (id)jw_jsonValue;
// url 参数转换JSON成字典
- (id)jw_urlConvertJSON;
// 将 URL 参数转换成字典
- (NSDictionary *)jw_urlConvertDictionary;

#pragma mark - BOOL

// 是否包含指定字符串
- (BOOL)jw_contains:(NSString *)string;
// 是否以某字符串结尾
// caseInsensitive 不区分大小写
- (BOOL)jw_endWith:(NSString *)endString caseInsensitive:(BOOL)caseInsensitive;
// 判断字符串是否为空或者长度为0
- (BOOL)jw_nilOrEmpty;
// 验证邮箱格式
- (BOOL)jw_validEmail;
// 验证电话格式
- (BOOL)jw_validMobile;
// 验证手机格式
- (BOOL)jw_validFixPhone;
// 验证身份证格式
- (BOOL)jw_validIDCard;
// 是否全部都是数字
- (BOOL)jw_allNumbers;
// 是否全部都是数字,且可以包含小数点
- (BOOL)jw_allDecimalDigit;
// 是否包含中文,英文,数字,下划线
- (BOOL)jw_validContainChiEng;
// 是否包英文,数字
- (BOOL)jw_validContainNumEng;
// 是否包含中文
- (BOOL)jw_containChinese;
// 是否为图片链接
- (BOOL)jw_imageURLString;
// 是否为JavaScript文件链接
- (BOOL)jw_javascriptURLString;
// 是否为URL链接
- (BOOL)jw_urlString;
// 是否为gif图片链接
- (BOOL)jw_gifImageUrl;
// 是否包含emoji表情
- (BOOL)jw_containsEmoji;
@end

NS_ASSUME_NONNULL_END
