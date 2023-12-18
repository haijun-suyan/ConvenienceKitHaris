//
//  UIView+Swizzle.h
//  ConvenienceKitHaris
//
//  Created by haijunyan on 2023/10/7.
//

#import <UIKit/UIKit.h>

@interface UIView (Swizzle)
- (void)custom_touchesBegan:(NSSet <UITouch *> *)touches withEvent:(UIEvent *)event;

- (void)customSetImp;

@end
