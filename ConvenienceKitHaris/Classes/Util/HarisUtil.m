//
//  HarisUtil.m
//  DemoDemo
//
//  Created by haijunyan on 2020/12/7.
//  Copyright © 2020 haijunyan. All rights reserved.
//

#import "HarisUtil.h"

@implementation HarisUtil

@end

NSString *esString(id obj) {
    NSString *str = @"";
    ESStringVal(&str, obj);
    return str;
}

BOOL ESStringVal(NSString **var, id obj)
{
    if (obj && (NSNull *)obj != [NSNull null]) {
        if ([obj isKindOfClass:[NSString class]]) {
            *var = obj;
            return YES;
        } else if ([obj isKindOfClass:[NSNumber class]]) {
            *var = [obj stringValue];
            return YES;
        }else if([obj isKindOfClass:[NSObject class]]){
            *var = [obj description];
            return YES;
        }
    }
    return NO;
}
