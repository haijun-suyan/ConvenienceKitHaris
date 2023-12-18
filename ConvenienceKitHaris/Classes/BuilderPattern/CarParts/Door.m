//
//  Door.m
//  BuilderPattern
//
//  Created by haijunyan on 2021/2/4.
//  Copyright © 2021年 haijunyan. All rights reserved.
//

#import "Door.h"

@implementation Door

- (void)doorColor:(UIColor *)color {
    
    // todo
}

- (NSString *)doorInfomation {
    return @"X1-door, color : red";
}

- (id)build {
    //实例对象特性设置
    NSLog(@"Door=%@",self);
    return nil;
}


@end
