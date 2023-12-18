//
//  Invoker.h
//  CommandPattern
//
//  Created by haijunyan on 2020/4/5.
//  Copyright © 2020年 haijunyan. All rights reserved.
//

#include "CommandProtocol.h"

@interface Invoker : NSObject

+ (instancetype)shareInstance;

- (void)rollBack;

- (void)addAndExcute:(id <CommandProtocol>)command;

@end
