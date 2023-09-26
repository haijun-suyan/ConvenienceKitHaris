//
//  UIView+Responder.h
//  DemoDemo
//
//  Created by haijunyan on 2021/3/4.
//  Copyright © 2021 haijunyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Responder)
///渲染图当前所属ViewController
- (UIViewController *)currentViewControllerForView;

@end
