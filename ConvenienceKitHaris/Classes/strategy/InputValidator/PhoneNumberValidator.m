//
//  PhoneNumberValidator.m
//  patternOfStrategy
//
//  Created by haijunyan on 2019/2/16.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import "PhoneNumberValidator.h"

@implementation PhoneNumberValidator
+ (BOOL)validateInput:(NSString *)input ErrorMessage:(NSString *__autoreleasing *)errorMessage {
    if (input.length <= 0) {
        *errorMessage = @"手机号尚未输入";
    } else {
        BOOL isMatch = [input isMatch:RX(@"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$")];
        if (isMatch == NO) {
            *errorMessage = @"请输入正确的手机号码";
        } else {
            *errorMessage = nil;
        }
    }
    return *errorMessage == nil ? YES : NO;
}

@end
