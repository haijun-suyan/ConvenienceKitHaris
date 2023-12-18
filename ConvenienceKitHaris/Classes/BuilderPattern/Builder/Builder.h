//  逻辑实现组装
//  Builder.h
//  BuilderPattern
//
//  Created by haijunyan on 2021/2/4.
//  Copyright © 2021年 haijunyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractEngineProtocol.h"
#import "AbstractWheelsProtocol.h"
#import "AbstractDoorProtocol.h"
#import "BuilderPotocol.h"

@interface Builder : NSObject

@property (nonatomic, strong) id <BuilderPotocol, AbstractEngineProtocol> engine;

@property (nonatomic, strong) id <BuilderPotocol, AbstractWheelsProtocol> wheels;

@property (nonatomic, strong) id <BuilderPotocol, AbstractDoorProtocol> door;

//产品信息
@property (nonatomic, strong) NSDictionary *productsInfo;

/**
 构建所有部件
 */
- (void)buildAllParts;

@end
