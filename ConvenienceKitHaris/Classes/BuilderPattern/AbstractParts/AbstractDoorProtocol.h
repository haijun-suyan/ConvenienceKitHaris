//  协议实现 间接型声明
//  AbstractDoor.h
//  BuilderPattern
//
//  Created by haijunyan on 2021/2/4.
//  Copyright © 2021年 haijunyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol AbstractDoorProtocol <NSObject>
//间接型公开声明API
@required

/**
 门的颜色

 @param color 颜色
 */

- (void)doorColor:(UIColor *)color;

/**
 信息

 @return 门信息
 */
- (NSString *)doorInfomation;

@end
