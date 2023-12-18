//
//  HarisUtil.h
//  DemoDemo
//
//  Created by haijunyan on 2020/12/7.
//  Copyright © 2020 haijunyan. All rights reserved.
//

#import <UIKit/UIKit.h>
//屏幕Width
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define DrawerView_Width  kScreenWidth*0.8

//屏幕height
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define DrawerView_Width kScreenWidth*0.8
#define IS_IOS_7 ([[[UIDevice currentDevice] systemVersion] floatValue] >=7.0 ? YES : NO)
//导航栏高度(适配iPhoneX)
#define SAFEAREA_TOPHEIGHT (SCREEN_HEIGHT == 812.0 ? 88 : 64)
//安全区域底部耳朵高度变化(适配iPhoneX)
#define SAFEAREA_BOTTOMHEIGHT (SCREEN_HEIGHT == 812.0 ? 34 : 0)
#define isIpad      ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define isIos7      ([[[UIDevice currentDevice] systemVersion] floatValue])
#define isIos8      ([[[UIDevice currentDevice] systemVersion] floatValue]) >= 8.f && ([[[UIDevice currentDevice] systemVersion] floatValue]) < 9.f
#define StatusbarSize ((isIos7 >= 7 && __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1)?20.f:0.f)
//字符串是否为空
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
//是否是空对象
#define kObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))
//打印
#ifdef DEBUG
#define NSLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define NSLog(...)
#endif

#ifdef DEBUG
#define DebugLog(...) NSLog(@"\nFile=%s\nFunc=%s\nLine=%d\nContent=%@\n",__FILE__,__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define DebugLog(...)
#endif

#define WS(weakSelf)  __weak typeof(&*self)weakSelf = self;

//一些缩写
#define kApplication        [UIApplication sharedApplication]
#define kKeyWindow          [UIApplication sharedApplication].keyWindow
#define kAppDelegate        [UIApplication sharedApplication].delegate
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]
#define strWithFormat(str) [NSString stringWithFormat:@"%@",str]
#define HarisFont(num) [UIFont fontWithName:@"HelveticaNeue" size:num]

@interface HarisUtil : NSObject

@end

NSString *esString(id obj);
BOOL ESStringVal(NSString **var, id obj);
