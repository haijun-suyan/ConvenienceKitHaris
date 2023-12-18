//  协议实现 间接型声明
//  AbstractWheelsProtocol.h
//  BuilderPattern
//
//  Created by haijunyan on 2021/2/4.
//  Copyright © 2021年 haijunyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol AbstractWheelsProtocol <NSObject>
//间接型公开声明API
@required

/**
 轮子数目

 @param number 数目
 */
- (void)wheelsNumber:(NSNumber *)number;

/**
 信息

 @return 轮子信息
 */
- (NSString *)wheelsInfomation;

@end
