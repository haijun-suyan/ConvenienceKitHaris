//
//  StartFirstDuring.m
//  ConvenienceKitHaris
//
//  Created by haijunyan on 2024/4/9.
//

#import "StartFirstDuring.h"
#import "LoseIMP.h"
#import <objc/runtime.h>
#import "UIView+Swizzle.h"
@implementation StartFirstDuring
//方法事件名(形参规则)部分=>执行体部分(IMP)
//load系统事件
//处于应用启动的第一阶段自动触发(+ (void)load与'UIViewController'无关)
+ (void)load {
    [super load];
    NSLog(@"loadload");

//    [[NSRunLoop mainRunLoop] addTimer:[NSTimer timerWithTimeInterval:4.0 target:self selector:@selector(timerCall) userInfo:nil repeats:YES] forMode:NSRunLoopCommonModes];

    //-[LoseIMP loseIMPMethod]: unrecognized selector sent to instance 0xcc80即@selector(loseIMPMethod)SEL 尚未钩挂 有效的IMP执行体
    //解决：自定义新SEL事件编号(IMP(事例)执行体),通过RT框架内的替换事件指针函数，促使(异常的)SEL钩挂上自定义新IMP(事例)执行体
    //  SEL事件编号
    //  IMP(事例)执行体
    //***SEL钩挂Hook上IMP执行体***
    Method customM = class_getInstanceMethod([LoseIMP class], @selector(customLoseIMPMethod));
    IMP customimp = method_getImplementation(customM);

    class_replaceMethod([LoseIMP class], @selector(loseIMPMethod), customimp,NULL);

    //  2个SEL(的Method)交换彼此的IMP
    //  Method事件指针
//    Method origin = class_getInstanceMethod([UIView class], @selector(touchesBegan:withEvent:));
//    Method custom = class_getInstanceMethod([UIView class], @selector(custom_touchesBegan:withEvent:));
    //映射程序在运行阶段供CPU读取并处理的IMP 可篡改
    //MethodSwizzling
    //2个SEL(的Method)交换彼此的IMP
//    method_exchangeImplementations(origin, custom);

    //(钩挂着默认IMP的)SEL(的Method) 钩挂写入 新IMP
    //@selector(loseIMPMethodSetImp) sel必钩挂 默认IMP 否则函数class_getInstanceMethod失效
    Method originM = class_getInstanceMethod([LoseIMP class], @selector(loseIMPMethodSetImp));
    Method customMM = class_getInstanceMethod([UIView class], @selector(customSetImp));
    IMP customimpM = method_getImplementation(customMM);
    method_setImplementation(originM, customimpM);

//    IMP customimpMm = class_getMethodImplementation([UIView class], @selector(customSetImp));

}

//+ (void)timerCall {
//    NSLog(@"%s",__func__);
//}

@end
