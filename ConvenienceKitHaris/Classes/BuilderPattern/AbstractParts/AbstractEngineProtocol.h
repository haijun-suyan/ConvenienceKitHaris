//  协议实现 间接型声明
//  AbstractEngineProtocol.h
//  BuilderPattern
//
//  Created by haijunyan on 2021/2/4.
//  Copyright © 2021年 haijunyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AbstractEngineProtocol <NSObject>
//间接型公开声明API
@required
/**
 引擎尺寸
 @param scale 尺寸
 */
- (void)engineScale:(CGFloat)scale;

/**
 引擎重量

 @param kg 重量
 */
- (void)engineWeight:(CGFloat)kg;

/**
 信息

 @return 引擎信息
 */
- (NSString *)engineInfomation;

@end
