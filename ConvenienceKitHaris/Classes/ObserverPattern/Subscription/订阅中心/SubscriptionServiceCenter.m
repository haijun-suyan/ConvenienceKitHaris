//  订阅编号广播站点服务中心类
//  SubscriptionServiceCenter.m
//  ObserverPattern
//  可变性:器皿内元素增删
//  Created by haijunyan on 2019/2/20.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import "SubscriptionServiceCenter.h"

//状态管理器(以核心对象(核心广播站点(主观察器))为存储元素)
//广播站点(主观察器)的集合对象
static NSMutableDictionary *_subscriptionDictionary = nil;

@implementation SubscriptionServiceCenter

+ (void)initialize {//进入编译阶段自动触发该事件方法API
    if (self == [SubscriptionServiceCenter class]) {
        //状态管理器实例化(开辟实例空间)
        _subscriptionDictionary = [NSMutableDictionary dictionary];
    }
}

//状态管理器内添加hash表容器(核心对象(核心广播站点))(订阅(编)号相对应相映射)
+ (void)createSubscriptionNumber:(NSString *)subscriptionNumber {
    NSParameterAssert(subscriptionNumber);
    NSHashTable *hashTable = [self existSubscriptionNumber:subscriptionNumber];
    if (!hashTable) {
        hashTable = [NSHashTable weakObjectsHashTable];
        [_subscriptionDictionary setObject:hashTable forKey:subscriptionNumber];
    }
}

//状态管理器内移除某个已存在的hash表容器(核心对象(核心广播站点))(订阅(编)号相对应相映射)
+ (void)removeSubscriptionNumber:(NSString *)subscriptionNumber {
    NSParameterAssert(subscriptionNumber);
    NSHashTable *hashTable = [self existSubscriptionNumber:subscriptionNumber];
    if (hashTable) {
        [_subscriptionDictionary removeObjectForKey:subscriptionNumber];
    }
}

//特定编号映射的广播站点hash表容器内添加绑定广播站点hash表下的听众(观察者/外围对象)
+ (void)addCustomer:(Customer *)customer withSubscriptionNumber:(NSString *)subscriptionNumber {
    NSParameterAssert(customer);
    NSParameterAssert(subscriptionNumber);
    
    NSHashTable *hashTable = [self existSubscriptionNumber:subscriptionNumber];
    [hashTable addObject:customer];
}

//特定编号映射的广播站点hash表容器内移除某个已存在的当前广播站点hash表下的听众(观察者/外围对象)
+ (void)removeCustomer:(Customer *)customer withSubscriptionNumber:(NSString *)subscriptionNumber {
    NSParameterAssert(subscriptionNumber);
    
    NSHashTable *hashTable = [self existSubscriptionNumber:subscriptionNumber];
    [hashTable removeObject:customer];
}

//特定编号映射的广播站点对外广播信息(广播站点hash表容器内当前已绑定的听众(观察者/外围对象)顺利接收到推送信号)
+ (void)sendMessage:(id)message toSubscriptionNumber:(NSString *)subscriptionNumber {
    NSParameterAssert(subscriptionNumber);
    NSHashTable *hashTable = [self existSubscriptionNumber:subscriptionNumber];
    if (hashTable) {
        NSEnumerator *enumertor = [hashTable objectEnumerator];
        id <SubscriptionServiceCenterProtocol> object = nil;
        while (object = [enumertor nextObject]) {
            if ([object respondsToSelector:@selector(subscriptionMessage:subscriptionNumber:)]) {
                
                [object subscriptionMessage:message subscriptionNumber:subscriptionNumber];
            }
        }
    }
}

#pragma mark - 文件内私有方法(判断字典容器内是否已存在目标外围对象所属的hash表容器)
//目标外围对象所属的hash表容器存在说明目标外围对象处于待监视状态
//目标外围对象所属的hash表容器不存在说明目标外围对象尚未被加入待监视状态
+ (NSHashTable *)existSubscriptionNumber:(NSString *)subscriptionNumber {
    return [_subscriptionDictionary objectForKey:subscriptionNumber];
}

@end
