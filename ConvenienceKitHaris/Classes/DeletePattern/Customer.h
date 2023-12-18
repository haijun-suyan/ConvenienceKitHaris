//
//  Customer.h
//  DelegatePattern
//
//  Created by wupeng on 2017/3/3.
//  Copyright © 2017年 wupeng. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Customer;

@protocol CustomerDelegate <NSObject>

@required

- (void)customer:(Customer *)customer buyItemCount:(NSInteger)count;

@end


@interface Customer : NSObject

@property (nonatomic, weak) id <CustomerDelegate> delegate;

- (void)buyItemCount:(NSInteger)count;

@end
