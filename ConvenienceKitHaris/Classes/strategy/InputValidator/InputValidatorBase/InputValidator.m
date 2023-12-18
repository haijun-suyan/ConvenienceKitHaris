//
//  InputValidator.m
//  patternOfStrategy
//  指针型符号errorMessage
//  Created by haijunyan on 2019/2/15.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import "InputValidator.h"

@implementation InputValidator
+ (BOOL)validateInput:(NSString *)input ErrorMessage:(NSString * *)errorMessage {
    return *errorMessage == nil ? YES : NO;
}


@end
