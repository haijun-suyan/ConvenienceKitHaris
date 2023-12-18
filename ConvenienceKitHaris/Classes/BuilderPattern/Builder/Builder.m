//
//  Builder.m
//  BuilderPattern
//
//  Created by haijunyan on 2021/2/4.
//  Copyright © 2021年 haijunyan. All rights reserved.
//

#import "Builder.h"

@implementation Builder

- (void)buildAllParts {
    //创建所有部件
    [self.engine build];
    [self.wheels build];
    [self.door build];
    
    NSMutableDictionary *dataDic = [NSMutableDictionary dictionary];
    // 组装产品
    dataDic[@"engine"] = [self.engine engineInfomation];
    dataDic[@"wheels"] = [self.wheels wheelsInfomation];
    dataDic[@"door"]   = [self.door doorInfomation];
    self.productsInfo = dataDic;
}

@end
