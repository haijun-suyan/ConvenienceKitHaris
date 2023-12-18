//
//  Customer.m
//  DelegatePattern
//
//  Created by wupeng on 2017/3/3.
//  Copyright © 2017年 wupeng. All rights reserved.
//

#import "Customer.h"

@implementation Customer

- (void)buyItemCount:(NSInteger)count {
    if (self.delegate && [self.delegate respondsToSelector:@selector(customer:buyItemCount:)]) {
        [self.delegate customer:self buyItemCount:count * 2];
    }
}

@end
