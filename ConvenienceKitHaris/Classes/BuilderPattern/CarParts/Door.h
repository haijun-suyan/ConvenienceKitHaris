//  抽象部件 车门
//  Door.h
//  BuilderPattern
//
//  Created by haijunyan on 2021/2/4.
//  Copyright © 2021年 haijunyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BuilderPotocol.h"
#import "AbstractDoorProtocol.h"

@interface Door : NSObject <BuilderPotocol,AbstractDoorProtocol>
//直接型公开声明

@end
