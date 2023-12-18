//  构图工具类(钥匙触发类/构造类)
//  ShapeMaker.h
//  FacadePattern
//  实际需求层的实际需求位置处 与 当前的动作实施触发类在同一个逻辑分支体系中
//  Created by haijunyan on 2019/2/27.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import "Rectangle.h"
#import "Circle.h"

@interface ShapeMaker : NSObject
/**
 *  绘制圆
 *  @param paras 参数(器皿容器类(NSDictionary/NSArray/Hash/NSSet))
 */
+ (void)drawCircleWithParas:(NSDictionary *)paras;

/// 绘制矩形
/// @param paras 参数
+ (void)drawRectangleWithParas:(NSDictionary *)paras;

/**
 *  绘制圆+矩形
 *  @param paras 参数
 */
+ (void)drawCircleAndRectangle:(NSDictionary *)paras;

@end
