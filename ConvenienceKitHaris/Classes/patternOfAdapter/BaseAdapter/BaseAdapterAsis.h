//  数据的处理逻辑公共特性部分(对象适配器父基础辅助类)
//  BaseAdapterAsis.h
//  patternOfAdapter
//  公共协议的助理类
//  Created by haijunyan on 2019/2/16.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseAdapterAsisProtocol.h"

@interface BaseAdapterAsis : NSObject <BaseAdapterAsisProtocol>

/**
 *  输入对象(数据模型:数据的读写辅助类Model实例对象值)//dataModel实例对象值将被写入到特定的对象适配器中进行处理(目标:实现协议访问数据的效果)
 */
@property (nonatomic, weak) id data;

/**
 *  与输入对象建立联系
 *
 *  @param data 输入的对象
 *
 *  @return 实例对象
 */
- (instancetype)initWithData:(id)data;

@end
