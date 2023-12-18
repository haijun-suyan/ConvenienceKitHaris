//  策略校验算法基类(输入校验器基类)
//  InputValidator.h
//  patternOfStrategy
//  指针型符号p进行指向操作(*p(左✳️指向)持有上一层级结构特征的写入)
//  左✳️指向/右🌟开辟(Alloc)
//  Created by haijunyan on 2019/2/15.
//  Copyright © 2019年 haijunyan. All rights reserved.
//  .h文件API定义声明公开继承特性
//  子类公共内容 存放于基类中(继承特性)

#import <UIKit/UIKit.h>
#import "RegExCategories.h"

@interface InputValidator : NSObject
/**
 算法策略校验
 @param input 待校验输入对象
 @param errorMessage 指针型符号errorMessage实现由底层指令提供错误的信息内容值
 @return YES校验通过,NO校验不通过
 */
+ (BOOL)validateInput:(NSString *)input ErrorMessage:(NSString * *)errorMessage;
@end
