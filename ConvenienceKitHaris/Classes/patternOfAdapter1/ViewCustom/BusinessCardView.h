//
//  ViewController.m
//  patternOfAdapter
//  公共协议的领导类
//  Created by haijunyan on 2019/2/16.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseAdapterAsisProtocol.h"


@interface BusinessCardView : UIView

/**
 *  名字
 */
@property (nonatomic, strong) NSString *name;

/**
 *  线条颜色
 */
@property (nonatomic, strong) UIColor  *lineColor;

/**
 *  电话号码
 */
@property (nonatomic, strong) NSString *phoneNumber;

/**
 *  加载数据(实现了BusinessCardAdapterProtocol协议的数据)
 *
 *  @param data 实现了BusinessCardAdapterProtocol协议的数据
 */
- (void)loadData:(id <BaseAdapterAsisProtocol>)data;

@end
