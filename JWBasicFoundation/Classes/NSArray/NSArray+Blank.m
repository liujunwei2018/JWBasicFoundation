//
//  NSArray+Black.m
//
//
//  Created by 刘君威 on 2019/1/4.
//  Copyright © 2019 ljw. All rights reserved.
//

#import "NSArray+Blank.h"

@implementation NSArray (Blank)

- (BOOL)isBlankArray {
    if (self == nil || self.count == 0 || [self isKindOfClass: [NSNull class]]) {
        return YES;
    }
    return NO;
    
}

@end
