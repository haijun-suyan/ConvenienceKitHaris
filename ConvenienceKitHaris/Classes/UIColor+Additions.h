//
//  UIColor+Additions.h
//  DemoDemo
//
//  Created by haijunyan on 2020/12/7.
//  Copyright © 2020 haijunyan. All rights reserved.
//

#import <UIKit/UIKit.h>

/* RGB颜色 */
#define ColorRGB(r, g, b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1.0]
/* RGBA颜色 */
#define ColorRGBA(r, g, b, a) [UIColor colorWithRed:(r) / 255.f green:(g) / 255.f blue:(b) / 255.f alpha:(a)]

/*UIColorFromRGB(0xffee00)*/
#define HarisColorWithHexA(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]
#define HarisColorWithHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//随机颜色
#define RANDOMCOLOR [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]
//十六进制
#define kColorWithHex(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]
#define isIos7      ([[[UIDevice currentDevice] systemVersion] floatValue])
//标题颜色
#define TextColor [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1]
//文本颜色
#define TextColor1 [UIColor colorWithRed:141/255.0 green:141/255.0 blue:141/255.0 alpha:1]
//灰色背景F8F8F8
#define ViewColor [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1]
//蓝色背景
#define BLUE_COLOR [UIColor colorWithRed:45/255.0 green:136/255.0 blue:212/255.0 alpha:1]
//#999999
#define lingtColor [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1]
//分割线e0e0e0
#define lineColor1 [UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1]
//底部导航FFFFFF
#define NavBColor [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1]
//#333
#define ShopStarLabelColor [UIColor colorWithRed:48/255.0 green:48/255.0 blue:48/255.0 alpha:1]
//#ff6f00
#define ShopStarColor [UIColor colorWithRed:253/255.0 green:111/255.0 blue:33/255.0 alpha:1]
//新加
//橙色
#define OrangeColor [UIColor colorWithRed:255/255.0 green:186/255.0 blue:0/255.0 alpha:1]
//文本红色
#define TextRedColor [UIColor colorWithRed:249/255.0 green:98/255.0 blue:105/255.0 alpha:1]
//文本绿色
#define TextGreenColor [UIColor colorWithRed:45/255.0 green:201/255.0 blue:60/255.0 alpha:1]
//副标题文字颜色
#define TextSubheadColor [UIColor colorWithRed:102/255.0 green:99/255.0 blue:51/255.0 alpha:1]
//正文文字颜色
#define TextMainBodyColor [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]
//辅助文字颜色
#define TextAssistColor [UIColor colorWithRed:153/255.0 green:147/255.0 blue:51/255.0 alpha:1]
//扫码确认登陆确认按钮颜色
#define CONFIRM_BTN_COLOR [UIColor colorWithRed:255/255.0 green:186/255.0 blue:1/255.0 alpha:1]
//#999
#define COLOR_999 [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1]
//#333
#define COLOR_333 [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]
//十六进制
#define kColorWithHex(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

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
 *  @param hexColor 16进制色值
 *  @param alpha 透明度 0～1之间的浮点数
 *  @return UIColor
 */
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)alpha ;

/**
 *  @brief  获取随机颜色
 *  @return 随机颜色
 */
+ (UIColor *)randomColor;

/**
 *  @brief  字符串转化为颜色
 *  @param string 字符串
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
