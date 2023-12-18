//  
//  Engine.m
//  BuilderPattern
//
//  Created by haijunyan on 2021/2/4.
//  Copyright © 2021年 haijunyan. All rights reserved.
//

#import "Engine.h"
#import <UIKit/UIKit.h>

@implementation Engine

- (void)engineScale:(CGFloat)scale {
    
    //todo
}

- (void)engineWeight:(CGFloat)kg {
    
    // todo
}

- (NSString *)engineInfomation {
    return @"X1-Engine, scale : 10, weight : 100";
}

- (id)build {
    //实例对象特性设置
    NSLog(@"engine=%@",self);
    return nil;
}

@end
