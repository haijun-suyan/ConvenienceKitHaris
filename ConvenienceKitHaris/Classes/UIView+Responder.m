//
//  UIView+Responder.m
//  DemoDemo
//
//  Created by haijunyan on 2021/3/4.
//  Copyright © 2021 haijunyan. All rights reserved.
//

#import "UIView+Responder.h"

@implementation UIView (Responder)
- (UIViewController *)currentViewControllerForView {
    UIResponder *responder = [self nextResponder];
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = [responder nextResponder];
    }
    return nil;
}

//阶段1、确定点触的真正对象：由下而上的查找过程
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.userInteractionEnabled) {
        if([self pointInside:point withEvent:event]){
            for (UIView *view in self.subviews) {
                UIView *hitTestView = [view hitTest:point withEvent:event];
                if(!hitTestView){
                    return view;
                }
            }
        }
    }
    return nil;
}

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
//    if (self.canRespond) {
//        for (NSValue *viewValue in [self allRectArray]) {
//            CGRect viewRect = viewValue.CGRectValue;
//            viewRect = [self convertRect:viewRect toView:self];
//            if (CGRectContainsPoint(viewRect, point)) {
//                return NO;
//            }
//        }
//    }
    return YES;
}

@end
