//  协议实现 间接型声明
//  BuilderPotocol.h
//  BuilderPattern
//
//  Created by haijunyan on 2021/2/4.
//  Copyright © 2021年 haijunyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BuilderPotocol <NSObject>
//间接型公开声明
@required
/**
 对象设置特性
 @return 返回带有特性的对象
 */
- (id)build;

@end
