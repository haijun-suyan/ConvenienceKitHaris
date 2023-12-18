//
//  Rectangle.m
//  FacadePattern
//
//  Created by haijunyan on 2019/2/27.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle

//某方面特定类的处理公共逻辑(事件重构)
- (void)draw {
    //从super关键字对应的Shape父类的draw事件API本身实例中退出来，代表[super draw]调用指令的执行已完成
    [super draw];
    //TODO新增功能指令(指令动作的实际位置)

    NSLog(@"RectangleDraw");
}

@end
