//  工厂通用基础类
//  BaseFactory.h
//  AbstractFactoryPattern
//
//  Created by haijunyan on 2020/3/2.
//  Copyright © 2020年 haijunyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseGoods.h"


@interface BaseFactory : NSObject

- (BaseGoods *)createPhone;



@end
