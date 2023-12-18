//  构建数据的处理逻辑
//  ViewController.m
//  patternOfAdapter
//
//  Created by haijunyan on 2019/2/16.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import "ModelAdapter.h"
#import "Model.h"

@implementation ModelAdapter

- (instancetype)initWithData:(id)data {
    self = [super initWithData:data];
    return self;
}

- (NSString *)name {
    
    Model *data = self.data;
    
    return data.name;
}

- (UIColor *)lineColor {
    
    Model *data = self.data;
    
    return data.lineColor;
}

- (NSString *)phoneNumber {
    
    Model *data = self.data;
    
    return data.phoneNumber;
}

@end
