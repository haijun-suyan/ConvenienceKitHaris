//
//  AppleFactory.m
//  AbstractFactoryPattern
//  事件函数的返回值表面特征为X,则return指令的实际返回值可以是X实例也可以为X子类实例(多态特性)比如 BaseGoods */NSObject */id/instancetype

//  Created by haijunyan on 2020/3/2.
//  Copyright © 2020年 haijunyan. All rights reserved.
//

#import "AppleFactory.h"

@implementation AppleFactory

- (BaseGoods *)createPhone {
    
    return [[IPhone alloc] init];
}

@end
