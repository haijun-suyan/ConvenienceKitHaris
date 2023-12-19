//
//  Custor.h
//  DelegatePattern
//
//  Created by haijunyan on 2018/3/3.
//  Copyright © 2018年 haijunyan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Custor;

@protocol CustomerDelegate <NSObject>

@required

- (void)customer:(Custor *)customer buyItemCount:(NSInteger)count;

@end


@interface Custor : NSObject

@property (nonatomic, weak) id <CustomerDelegate> delegate;

- (void)buyItemCount:(NSInteger)count;

@end
