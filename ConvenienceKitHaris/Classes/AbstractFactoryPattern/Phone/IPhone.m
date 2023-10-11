//
//  IPhone.m
//  AbstractFactoryPattern
//
//  Created by haijunyan on 2020/3/2.
//  Copyright © 2020年 haijunyan. All rights reserved.
//

#import "IPhone.h"

@implementation IPhone
//重构继承于父类的协议事件
- (void)phoneCall {
    [super phoneCall];
    NSLog(@"iPhone phoneCall");
}

- (void)sendMessage {
    [super sendMessage];
    NSLog(@"iPhone sendMessage");
}

//特定商品事件本身实例
- (void)fingerprintIndetification {
    
    NSLog(@"iPhone fingerprintIndetification");
}


@end
