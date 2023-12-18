//  系统抽象基类
//  AbstractSystem.h
//  BridgePattern
//  抽象层利用各种多态机制实现聚合关联(关系)
//  Created by haijunyan on 2019/6/2.
//  Copyright © 2019年 haijunyan. All rights reserved.
//  父基类 多考虑 多态机制
//  字段名表面呈现结构/实例内存实际结构

#import <Foundation/Foundation.h>
#import "AbstractImplementor.h"
//父基类
@interface AbstractSystem : NSObject
//父基执行者
@property(nonatomic,strong)AbstractImplementor *implementor;

//执行事件(事件API接口)
- (void)command_up;
- (void)command_down;
- (void)command_left;
- (void)command_right;
- (void)command_a;
- (void)command_b;

//载入系统
- (void)loadSystem;
@end
