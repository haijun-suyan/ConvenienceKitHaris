//  对核心广播站点存在依赖性的听众类(外围对象/观察者)(跟随响应)
//  Customer.h
//  ObserverPattern
//  助理类(待观察者/外围对象类)
//  Created by haijunyan on 2019/2/20.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SubscriptionServiceCenterProtocol.h"

@interface Customer : NSObject <SubscriptionServiceCenterProtocol>

@end
