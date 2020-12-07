//
//  UIColor+Additions.h
//  DemoDemo
//
//  Created by haijunyan on 2020/12/7.
//  Copyright © 2020 haijunyan. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *    @brief    RGB颜色(未全局公开).
 */
#define HarisColor(r,g,b) PNCColorRGBA(r,g,b,1.0)
/**
 *    @brief    RGBA颜色.
 */
#define HarisColorRGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
/**
 *    @brief    颜色设置(UIColorFromRGB(0xffee00)).
 */
#define HarisColorWithHexA(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

#define HarisColorWithHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface UIColor (Additions)
/**
 *  @brief 将16进制色值转成RGB值
 *
 *  @param hexColor 16进制色值
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHex:(long)hexColor;

/**
 *  @brief 将16进制色值转成RGB值
 *
 *  @param hexColor 16进制色值
 *  @param alpha 透明度 0～1之间的浮点数
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)alpha ;

/**
 *  @brief  获取随机颜色
 *
 *  @return 随机颜色
 */
+ (UIColor *)randomColor;

/**
 *  @brief  字符串转化为颜色
 *
 *  @param string 字符串
 *
 *  @return 颜色
 */
+ (UIColor *)colorFormString:(NSString *)string;

+ (UIColor *)colorFormString:(NSString *)string alpha:(float)alpha;
/**
 16进制色彩
 @param hexColor @"000000"
 */
+ (UIColor*)colorWithHexadecimalColorString: (NSString *)hexColor;
@end
