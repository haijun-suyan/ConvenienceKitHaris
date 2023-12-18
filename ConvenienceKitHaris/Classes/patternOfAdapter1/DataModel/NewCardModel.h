//
//  ViewController.m
//  patternOfAdapter
//
//  Created by haijunyan on 2019/2/16.
//  Copyright © 2019年 haijunyan. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface NewCardModel : NSObject

/**
 *  名字
 */
@property (nonatomic, strong) NSString *name;

/**
 *  线条颜色
 */
@property (nonatomic, strong) NSString *colorHexString;

/**
 *  电话号码
 */
@property (nonatomic, strong) NSString *phoneNumber;

@end
