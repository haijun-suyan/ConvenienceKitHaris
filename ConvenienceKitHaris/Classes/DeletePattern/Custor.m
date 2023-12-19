//
//  Custor.m
//  DelegatePattern
//
//  Created by haijunyan on 2018/3/3.
//  Copyright © 2018年 haijunyan. All rights reserved.
//

#import "Custor.h"

@implementation Custor

- (void)buyItemCount:(NSInteger)count {
    if (self.delegate && [self.delegate respondsToSelector:@selector(customer:buyItemCount:)]) {
        [self.delegate customer:self buyItemCount:count * 2];
    }
}

@end
