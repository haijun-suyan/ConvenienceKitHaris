//
//  KVCUseRuleViewController.m
//  ConvenienceKitHaris
//  对象下的KVC
//  Foundation框架内NSKeyValueCoding.h文件内的函数
//  是否允许使用KVC直接访问实例变量, 默认YES accessInstanceVariablesDirectly
//  Created by haijunyan on 2023/10/11.
//  描述属性 //键 //单级属性
//  描述属性链 //键链 //多级属性
//  键值编码KVC  关注点在于  读写 类中已定义属性 所映射的数据

#import "KVCUseRuleViewController.h"
#import "Product.h"
@interface KVCUseRuleViewController ()

@end

@implementation KVCUseRuleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Product *prod = [[Product alloc] init];
    prod.name = @"商品名字";
    prod.price = 100;
    //对象下 通过KVC(取值函数) 取值
    NSString *name = [prod valueForKey:@"name"];

    //键值编码KVC  关注点在于  (快速)读写 对象类中已定义属性 所映射的数据
//    [prod valueForKey:@"jjj"];
//    [prod setValue:@"新商品" forKey:@"jjj"];
    //exception:[<Product 0x600001adec00> valueForUndefinedKey:]: this class is not key value coding-compliant for the key jjj. 类Product与key'jjj' 键值编码KVC不兼容
    //exception:[<Product 0x600003216880> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key jjj.类Product与key'jjj' 键值编码KVC不兼容






}



@end
