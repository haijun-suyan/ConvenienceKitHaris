//  事件函数的返回值表面特征为X,则return指令的实际返回值可以是X实例也可以为X子类实例(多态特性)
//  FactoryManager.m
//  AbstractFactoryPattern
//
//  Created by haijunyan on 2020/3/2.
//  Copyright © 2020年 haijunyan. All rights reserved.
//

#import "FactoryManager.h"

@implementation FactoryManager

+ (BaseFactory *)factoryWithBrand:(KFactoryType)factoryType {
    BaseFactory *factory = nil;
    if (factoryType == KApple) {
        factory = [[AppleFactory alloc] init];
    } else if (factoryType == KGoogle) {
        factory = [[GoogleFactory alloc] init];
    }
    return factory;

}

@end
