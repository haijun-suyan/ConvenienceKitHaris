//
//  LoseIMP.m
//  ConvenienceKitHaris
//
//  Created by haijunyan on 2023/10/8.
//

#import "LoseIMP.h"

@implementation LoseIMP
- (void)customLoseIMPMethod {
    NSLog(@"customLoseIMPMethod");
}

//@selector(loseIMPMethodSetImp) sel必钩挂 默认IMP 否则函数class_getInstanceMethod失效
- (void)loseIMPMethodSetImp {

}

@end
