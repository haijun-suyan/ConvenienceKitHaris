//  构建数据的处理逻辑
//  ViewController.m
//  patternOfAdapter
//
//  Created by haijunyan on 2019/2/16.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import "CardAdapter.h"
#import "Model.h"
#import "NewCardModel.h"

@implementation CardAdapter

- (instancetype)initWithData:(id)data {
    self = [super init];
    if (self) {
        self.data = data;
    }
    
    return self;
}

//重写协议成员函数(将各数据模型中已保存的有效数据值作为协议成员函数此时的返回值供调用)
- (NSString *)name {
    
    NSString *name = nil;
    
    if ([self.data isMemberOfClass:[Model class]]) {
        
        Model *model = self.data;
        name         = model.name;
        
    } else if ([self.data isMemberOfClass:[NewCardModel class]]) {
        
        NewCardModel *model = self.data;
        name                = model.name;
        
    }
    
    return name;
}

- (UIColor *)lineColor {
    
    UIColor *lineColor = nil;
    
    if ([self.data isMemberOfClass:[Model class]]) {
        
        Model *model = self.data;
        lineColor    = model.lineColor;
        
    } else if ([self.data isMemberOfClass:[NewCardModel class]]) {
        
        NewCardModel *model = self.data;
        
        if ([model.colorHexString isEqualToString:@"black"]) {
            
            lineColor = [UIColor blackColor];
            
        } else {
            
            lineColor = [UIColor redColor];
            
        }
    }
    
    return lineColor;
}

- (NSString *)phoneNumber {
    
    NSString *phoneNumber = nil;
    
    if ([self.data isMemberOfClass:[Model class]]) {
        
        Model *model = self.data;
        phoneNumber  = model.phoneNumber;
        
    } else if ([self.data isMemberOfClass:[NewCardModel class]]) {
        
        NewCardModel *model = self.data;
        phoneNumber         = model.phoneNumber;
        
    }
    
    return phoneNumber;
}

@end
