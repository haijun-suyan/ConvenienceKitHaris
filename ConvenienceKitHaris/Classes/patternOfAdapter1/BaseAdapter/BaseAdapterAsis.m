//
//  BaseAdapterAsis.m
//  patternOfAdapter
//
//  Created by haijunyan on 2019/2/16.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import "BaseAdapterAsis.h"

@implementation BaseAdapterAsis

- (instancetype)initWithData:(id)data {
    self = [super init];
    if (self) {
        self.data = data;
    }
    return self;
}

- (NSString *)name {

    return nil;
}

- (UIColor *)lineColor {

    return nil;
}

- (NSString *)phoneNumber {

    return nil;
}

@end
