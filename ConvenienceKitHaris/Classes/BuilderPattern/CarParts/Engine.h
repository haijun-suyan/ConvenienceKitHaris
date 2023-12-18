//  抽象部件 引擎
//  Engine.h
//  BuilderPattern
//
//  Created by haijunyan on 2021/2/4.
//  Copyright © 2021年 haijunyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BuilderPotocol.h"
#import "AbstractEngineProtocol.h"

@interface Engine : NSObject <BuilderPotocol,AbstractEngineProtocol>
//直接型公开声明

@end
