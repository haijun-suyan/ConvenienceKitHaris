//
//  TCPProtocol.h
//  DelegatePattern
//
//  Created by wupeng on 2017/3/3.
//  Copyright © 2017年 wupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TCPProtocol <NSObject>

@required

// 获取源端口号
- (NSInteger)sourcePort;

// 获取目的地端口号
- (NSInteger)destinationPort;

@end
