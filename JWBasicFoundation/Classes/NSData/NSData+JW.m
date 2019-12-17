//
//  NSData+LW.m
//  Demo
//
//  Created by 刘君威 on 2019/4/15.
//  Copyright © 2019 liujunwei. All rights reserved.
//

#import "NSData+JW.h"

@implementation NSData (JW)

- (id)jw_jsonObject {
    NSError *error = nil;
    if (self.length) {
        // NSJSONReadingMutableContainers: 返回对象类型为可变的字典或数组
        // NSJSONReadingMutableLeaves:如果返回的对象是不可变,但是使用可变类型接,  调用可变方法时会崩溃
        id json = [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingMutableContainers error:&error];
        if (error) {
            return nil;
        }
        return json;
    }
    
    return nil;
}

@end
