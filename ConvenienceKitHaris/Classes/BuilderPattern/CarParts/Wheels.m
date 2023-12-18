//
//  Wheels.m
//  BuilderPattern
//
//  Created by haijunyan on 2021/2/4.
//  Copyright © 2021年 haijunyan. All rights reserved.
//

#import "Wheels.h"

@implementation Wheels

- (void)wheelsNumber:(NSNumber *)number {
    
    // todo
}

- (NSString *)wheelsInfomation {
    return @"X1-wheels, number : 4";
}

- (id)build {
    //实例对象特性设置
    NSLog(@"Wheels=%@",self);
    return nil;
}


@end
