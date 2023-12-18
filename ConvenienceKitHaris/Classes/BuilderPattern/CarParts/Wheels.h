//  抽象部件 车轮
//  Wheels.h
//  BuilderPattern
//
//  Created by haijunyan on 2021/2/4.
//  Copyright © 2021年 haijunyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BuilderPotocol.h"
#import "AbstractWheelsProtocol.h"

@interface Wheels : NSObject <BuilderPotocol, AbstractWheelsProtocol>
//直接型公开声明

@end
