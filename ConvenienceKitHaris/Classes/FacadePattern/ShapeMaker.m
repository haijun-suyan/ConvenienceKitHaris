//
//  ShapeMaker.m
//  FacadePattern
//
//  Created by haijunyan on 2019/2/27.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import "ShapeMaker.h"

@implementation ShapeMaker
+ (void)drawCircleWithParas:(NSDictionary *)paras {
    NSNumber *radiusNum = [paras objectForKey:@"radius"];
    //圆
    Circle *circle = [Circle new];
    circle.radius  = [radiusNum floatValue];
    //绘制
    [circle draw];
}

+ (void)drawRectangleWithParas:(NSDictionary *)paras {
    NSNumber *rectangleWidNum = [paras objectForKey:@"rectangleWid"];
    NSNumber *rectangleHhtNum = [paras objectForKey:@"rectangleHht"];
    //矩形
    Rectangle *rectangle = [Rectangle new];
    rectangle.width = [rectangleWidNum floatValue];
    rectangle.height = [rectangleHhtNum floatValue];
    //绘制
    [rectangle draw];
}

+ (void)drawCircleAndRectangle:(NSDictionary *)paras {
    NSNumber *radiusNum = [paras objectForKey:@"radius"];
    //圆
    Circle *circle = [Circle new];
    circle.radius = [radiusNum floatValue];
    //绘制
    [circle draw];

    NSNumber *rectangleWidNum = [paras objectForKey:@"rectangleWid"];
    NSNumber *rectangleHhtNum = [paras objectForKey:@"rectangleHht"];
    //矩形
    Rectangle *rectangle = [Rectangle new];
    rectangle.width = [rectangleWidNum floatValue];
    rectangle.height = [rectangleHhtNum floatValue];
    //绘制
    [rectangle draw];
}


@end
