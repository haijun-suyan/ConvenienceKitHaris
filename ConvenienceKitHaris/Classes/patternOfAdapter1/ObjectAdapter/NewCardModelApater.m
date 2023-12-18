//  构建数据的处理逻辑
//  ViewController.m
//  patternOfAdapter
//
//  Created by haijunyan on 2019/2/16.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import "NewCardModelApater.h"
#import "NewCardModel.h"

@implementation NewCardModelApater

- (instancetype)initWithData:(id)data {
    
    self = [super init];
    if (self) {
        
        self.data = data;
    }
    
    return self;
}

- (NSString *)name {
    
    NewCardModel *data = self.data;
    
    return data.name;
}

- (UIColor *)lineColor {
    
    NewCardModel *data = self.data;
    
    if ([data.colorHexString isEqualToString:@"green"]) {
        
        return [UIColor greenColor];
        
    } else {
        
        return [UIColor redColor];
        
    }
}

- (NSString *)phoneNumber {
    
    NewCardModel *data = self.data;
    
    return data.phoneNumber;
}

@end
