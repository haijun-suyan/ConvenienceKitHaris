//  统一管控辅助类
//  FactoryManager.h
//  AbstractFactoryPattern
//  不同工厂间切换
//  Created by haijunyan on 2020/3/2.
//  Copyright © 2020年 haijunyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppleFactory.h"
#import "GoogleFactory.h"

/**
 工厂风格类型枚举 mapValue映射值(由0,1,2,3...逐步增大)
 */
typedef NS_ENUM(NSUInteger,KFactoryType){
    //声明状态成员
    KApple                = 0 ,
    KGoogle               = 1,
};

@interface FactoryManager : NSObject

/**
 获取工厂实例值
 @param factoryType 工厂类型
 */
+ (BaseFactory *)factoryWithBrand:(KFactoryType)factoryType;

@end
