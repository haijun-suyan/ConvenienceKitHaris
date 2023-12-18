//  .h协议规范文件
//  SubscriptionServiceCenterProtocol.h
//  订阅编号广播站点服务中心协议
//  ObserverPattern
//
//  Created by haijunyan on 2019/2/20.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import <Foundation/Foundation.h>

//定义某个协议领域(体系)
@protocol SubscriptionServiceCenterProtocol <NSObject>

@required
//必要型协议函数声明(必须在助理类(观察者/外围对象类)中实例化)
//听众/观察者类接收到广播📢消息后回调协议函数
- (void)subscriptionMessage:(id)message subscriptionNumber:(NSString *)subscriptionNumber;

@optional
//可选型协议函数声明(根据具体需求考虑是否实例化)


@end


