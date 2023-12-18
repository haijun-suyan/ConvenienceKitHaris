//  static程序应用彻底关闭之前静态内存区不会被释放将一直存在
//  单例的概念：程序应用彻底关闭之前静态内存区一直存在不会被释放(强调static静态特性(特定单例类下/单例字段名只进行一次alloc动作))
//  Invoker.m
//  CommandPattern
//  dispatch_once_t表示long 长整型基本数据类型
//  Created by haijunyan on 2020/4/5.
//  Copyright © 2020年 haijunyan. All rights reserved.
//  甲方领导
#import "Invoker.h"

@interface Invoker()

@property (nonatomic,strong) NSMutableArray *queueCommands;

@end

@implementation Invoker

+ (instancetype)shareInstance {
    static Invoker *shareInstanceValue = nil;
    static dispatch_once_t oncePredicate;
    //C风格dispatch_once事件函数的行参
    //predicate：dispatch_once_t *基本数据类型长整型的指针型
    //block：dispatch_block_t 块风格类型
    dispatch_once(&oncePredicate, ^{
        shareInstanceValue = [[Invoker alloc] init];
        shareInstanceValue.queueCommands = [NSMutableArray array];
    });
    return shareInstanceValue;
}
//多态特性(单个甲方->多个乙方)
- (void)addAndExcute:(id <CommandProtocol>)command {
    NSParameterAssert(command);
    //断言宏command为真
    [self.queueCommands addObject:command];
    //通用协议事件调用
    [command excute];
}

- (void)rollBack {

    id <CommandProtocol> command = self.queueCommands.lastObject;
    [command rollBackExcute];
    
    [self.queueCommands removeLastObject];
}

+ (void)onceCustom:(dispatch_once_t *)predicate Block:(void(^)(void))block  {
    if (!(*predicate)) {
        if (block) {
            block();
            dispatch_once_t p = 1;
            predicate = &p;
        }
    }
}

@end
