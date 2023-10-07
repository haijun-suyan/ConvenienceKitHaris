//
//  RTSenseViewController.m
//  ConvenienceKitHaris
//  RunTime框架的API使用场景
//  Created by haijunyan on 2023/10/7.
//  应用程序逆向拆解

#import "RTSenseViewController.h"
#import <objc/runtime.h>

typedef struct objc_ivar *Ivar;
typedef struct objc_property *objc_property_t;
typedef struct objc_method *Method;



@interface RTSenseViewController ()

@end

@implementation RTSenseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self runTimeAnalysis];
    [self propertyType];
    [self copyMethodList];


    //可篡改映射程序在运行阶段供CPU读取并处理的事件(MethodSwizzling)






}

//获取变量名
//class_copyIvarList ivar指针表
//ivar_getName ivar(变量)指针 变量名
- (void)runTimeAnalysis {
    u_int count = 0;
    //C语法风格
//    struct objc_ivar * *ivars = class_copyIvarList([UIView class], &count);
//    unsigned int * _Nullable outCount:函形参outCount接收unsignedint内容区的地址(指针函形参outCount可以持有unsignedint内容区的地址(指针形参outCount对应的底层指令可以实现对相应内存区域的访问修改写入新数据值))
    //class_copyIvarList函数获取的列表中元素的数目通过底层的指针访问指令写入count对应的空间内(count对应区域内存放有元素的数目数据)
    //C语言体系C语法定义声明ivars数组
    Ivar* ivars = class_copyIvarList([UIView class], &count);
    for (int i = 0; i<count; i++) {
        //C语言ivar_getName函数事件：获取ivar地址指针对应的变量名
        const char *ivarName = ivar_getName(ivars[i]);
        NSString *ivarNameNS = [NSString stringWithCString:ivarName encoding:NSUTF8StringEncoding];
        NSLog(@"ivarNameNS=%@",ivarNameNS);
    }
}

//获取属性名
//class_copyPropertyList Property指针表
//property_getName property(属性)指针 属性名
- (void)propertyType {
    u_int count = 0;
    struct objc_property * *properties = class_copyPropertyList([UIView class], &count);
    for (int i = 0; i<count; i++) {
        const char *propertyName = property_getName(properties[i]);
        NSString *propertyNameNS = [NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding];
        NSLog(@"propertyNameNS=%@",propertyNameNS);
    }
    free(properties);
}

//获取事件名
//class_copyMethodList methods指针表
//method_getName method(事件)指针 事件名
//method_getNumberOfArguments method(事件)指针 行参坑位符的数量
- (void)copyMethodList {
    //方法事件细分2部分：方法事件名(形参规则)部分+执行体部分
    int a = 3;
    int *p = &a;//字段名p持有&a(变量a域地址)

    u_int count = 0;
    //获取所有方法(别名Method层次带有容器特性)
    //从内存的角度而言，methods为指针型符号变量(直接持有指针地址),methods持有的指针地址对应的内存域中存放的元素为Method结构特征型值
//    Method *methods = class_copyMethodList([UIView class], &count);
    //method列表(元素method)
    struct objc_method * *methods = class_copyMethodList([UIView class], &count);
    for (int i = 0; i<count; i++) {
        Method method = methods[i];
        //方法(方法事件名(形参规则)部分)类型风格是SEL选择器风格类型
        //T:C语法体系
        //名称信息以SEL风格类型存在
        SEL methodName = method_getName(method);
        NSString *methodNameStr = [NSString stringWithCString:sel_getName(methodName) encoding:NSUTF8StringEncoding];
        int arguments = method_getNumberOfArguments(method);
        NSLog(@"methodNameStr[%@],argumentsCNT=%d",methodNameStr,arguments);
    }
    //调用C库函数void free(void *)释放之前调用calloc、malloc或 realloc函数所申请的内存空间。
    free(methods);
}






@end
