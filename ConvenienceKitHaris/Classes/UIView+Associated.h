//
//  UIView+Associated.h
//  ConvenienceKitHaris
//
//  Created by haijunyan on 2023/10/10.
//  正常不推荐新增属性名(方式)(控制数据I/O进出分类结构)
//  分类新增属性存在3大缺陷：缺失IMP 无法定义(普通)变量读写 数据混乱


#import <UIKit/UIKit.h>

@interface UIView (Associated)

@property(nonatomic,assign)NSInteger level;
@end

