//  订阅编号广播站点服务中心类
//  SubscriptionServiceCenter.h
//  ObserverPattern
//  领导类
//  Created by haijunyan on 2019/2/20.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SubscriptionServiceCenterProtocol.h"


#import "Customer.h"

@interface SubscriptionServiceCenter : NSObject

#pragma mark - 广播站点

/**
 创建与订阅(编)号相对应相映射的核心广播站点

 @param subscriptionNumber 订阅(编)号
 */
+ (void)createSubscriptionNumber:(NSString *)subscriptionNumber;

/**
 移除特定编号映射的广播站点

 @param subscriptionNumber 订阅(编)号
 */
+ (void)removeSubscriptionNumber:(NSString *)subscriptionNumber;

#pragma mark - 观察者/外围对象

/**
 特定编号下的广播站点添加绑定听众(观察者/外围对象)
 
 @param customer 观察者/外围对象
 @param subscriptionNumber 订阅(编)号
 */
+ (void)addCustomer:(Customer *)customer withSubscriptionNumber:(NSString *)subscriptionNumber;


/**
 从特定编号下的广播站点中移除听众(待观察者/外围对象)

 @param customer 观察者/外围对象
 @param subscriptionNumber 订阅(编)号
 */
+ (void)removeCustomer:(Customer *)customer withSubscriptionNumber:(NSString *)subscriptionNumber;


#pragma mark - 特定编号下的广播站点消息广播📢

/**
 特定编号下的广播站点消息广播📢

 @param message 广播的消息内容
 @param subscriptionNumber 订阅(编)号
 */
+ (void)sendMessage:(id)message toSubscriptionNumber:(NSString *)subscriptionNumber;

@end
