//
//  AbstractFactoryViewController.m
//  ConvenienceKitHaris
//  定义声明字段名本质开辟栈内存(存放堆内存的入口地址(多态效应))
//  Created by haijunyan on 2023/10/11.
//

#import "AbstractFactoryViewController.h"
#import "FactoryManager.h"

@interface AbstractFactoryViewController ()

@end

@implementation AbstractFactoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[FactoryManager factoryWithBrand:KGoogle]：表达式的结果值本身实例对象值本来的堆内存的结构特征可以和持有该内容实例对象值堆内存的栈内存字段符号名预设的结构特征一致也可以是栈内存字段符号名预设的结构特征的子类特征
    //栈内存字段符号名属于预设特征
    //真正运行时地址内存呈现出来的实际特征取决于实例对象值本来的堆内存的结构特征
    //通熟而言，完整的赋值指令：左侧字段名部分对应预设特征，右侧表达式的实例值本身特征为运行时实际呈现特征(真实的特征)
    //获取工厂
    BaseFactory *googleFactory = [FactoryManager factoryWithBrand:KGoogle];
    //创建商品
    Android *androidPhone = (Android *)[googleFactory createPhone];

    //商品通用事件
    [androidPhone phoneCall];
    //定制主题(特定事件)
    [androidPhone customTheme];


    // 获取工厂
    BaseFactory *appleFactory = [FactoryManager factoryWithBrand:KApple];
    // 创建商品
    IPhone *applePhone = (IPhone *)[appleFactory createPhone];

    //商品通用事件
    [applePhone phoneCall];
    //指纹识别(特定事件)
    [applePhone fingerprintIndetification];

}

@end
