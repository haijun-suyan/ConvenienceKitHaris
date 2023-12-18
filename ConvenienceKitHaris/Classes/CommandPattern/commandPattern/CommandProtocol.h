//
//  CommandProtocol.h
//  CommandPattern
//
//  Created by haijunyan on 2020/4/5.
//  Copyright © 2020年 haijunyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CommandProtocol <NSObject>
@required
//通用协议事件API命令执行
- (void)excute;
//通用协议事件API回滚撤销
- (void)rollBackExcute;

@end
