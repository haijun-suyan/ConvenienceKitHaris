//
//  EmailValidator.m
//  patternOfStrategy
//
//  Created by haijunyan on 2019/2/16.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import "EmailValidator.h"

@implementation EmailValidator
//父类验证方法的重构写
+ (BOOL)validateInput:(NSString *)input ErrorMessage:(NSString *__autoreleasing *)errorMessage {
    if (input.length <= 0) {
        *errorMessage = @"邮箱尚未输入";
    } else {
        BOOL isMatch = [input isMatch:RX(@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}")];
        if (isMatch == NO) {
            *errorMessage = @"请输入正确的邮箱";
        } else {
            *errorMessage = nil;
        }
    }
    return *errorMessage == nil ? YES : NO;
}

@end
