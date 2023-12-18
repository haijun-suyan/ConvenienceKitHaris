//
//  GoodsProtocol.h
//  AbstractFactoryPattern
//  商品的通用事件对应所属协议
//  Created by haijunyan on 2020/3/2.
//  Copyright © 2020年 haijunyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GoodsProtocol <NSObject>

//电话协议事件
- (void)phoneCall;

//短信协议事件
- (void)sendMessage;

@end
