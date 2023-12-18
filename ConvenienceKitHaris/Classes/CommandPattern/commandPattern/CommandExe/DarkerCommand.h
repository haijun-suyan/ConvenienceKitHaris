//
//  DarkerCommand.h
//  CommandPattern
//
//  Created by haijunyan on 2020/4/5.
//  Copyright © 2020年 haijunyan. All rights reserved.
//

#import "Receiver.h"
#import "CommandProtocol.h"

@interface DarkerCommand : NSObject <CommandProtocol>

/**
 与接收器绑定并设置参数

 @param receiver 接收器
 @param parameter 参数
 @return DarkerCommand
 */
- (instancetype)initWithReceiver:(Receiver *)receiver parameter:(CGFloat)parameter;

@end
