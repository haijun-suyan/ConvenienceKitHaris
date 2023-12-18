//
//  Customer.m
//  ObserverPattern
//
//  Created by haijunyan on 2019/2/20.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import "Customer.h"

@implementation Customer
- (id)init{
    self = [super init];
    return self;
}

#pragma mark ----- SubscriptionServiceCenterProtocol
//待观察者 所绑定的 回调IMP
- (void)subscriptionMessage:(id)message subscriptionNumber:(NSString *)subscriptionNumber {//听众/待观察者对象接收到广播📢消息后回调
    NSLog(@"%@广播站点播放%@信息被听众收到",subscriptionNumber,message);
}



@end
