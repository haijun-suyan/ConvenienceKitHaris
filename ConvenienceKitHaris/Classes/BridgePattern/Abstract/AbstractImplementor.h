//
//  AbstractImplementor.h
//  BridgePattern
//
//  Created by haijunyan on 2019/6/2.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import <Foundation/Foundation.h>
//ExeCommandType(动作操作分支)
typedef NS_ENUM(NSUInteger, EcommandType) {
    kUp,
    kDown,
    kLeft,
    kRight,
    kA,
    kB,
    KO,
    KX,
};

@interface AbstractImplementor : NSObject
/**
 执行命令

 @param command 命令枚举值
 */
- (void)loadCommand:(EcommandType)command;

@end
