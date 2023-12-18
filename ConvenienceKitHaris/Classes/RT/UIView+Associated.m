//
//  UIView+Associated.m
//  ConvenienceKitHaris
//
//  Created by haijunyan on 2023/10/10.
//

#import "UIView+Associated.h"

@implementation UIView (Associated)
//copyPropertyList容器(Property指针表容器)帮助程序自动构建getter/setter的IMP执行体

//缺陷1.Category分类(补充)结构中缺少copyPropertyList容器(Property指针表容器)即默认不存在getter/setter的IMP执行体 缺陷2.Category分类(补充)文件语法不支持定义变量名即意味着分类文件内通过文件级的全局变量进行数据的读存不方便且(缺陷3)易造成数据混乱
//综合3大缺陷，不推荐新增属性名方式(控制数据I/O进出分类文件)

//    -[UIView setLevel:]: unrecognized selector sent to instance 0xa940即@selector(setLevel:) SEL缺失IMP执行体
//    -[UIView level]: unrecognized selector sent to instance 0x0ca0即@selector(level) SEL缺失IMP执行体

//手动自定义setter事件及IMP
- (void)setLevel:(NSInteger)level {
    //IMP执行体
    self.tag = level;

}

//手动自定义getter事件及IMP
- (NSInteger)level
{
    return self.tag;
}

@end
