//
//  Android.m
//  AbstractFactoryPattern
//
//  Created by haijunyan on 2020/3/2.
//  Copyright © 2020年 haijunyan. All rights reserved.
//

#import "Android.h"

@implementation Android
//重构继承于父类的协议事件
- (void)phoneCall {
    [super phoneCall];
    NSLog(@"Android phoneCall");
}

- (void)sendMessage {
    [super sendMessage];
    NSLog(@"Android sendMessage");
}

//特定商品事件本身实例
- (void)customTheme {
    
    NSLog(@"Android customTheme");
}


@end
