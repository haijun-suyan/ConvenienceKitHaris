//
//  Receiver.h
//  CommandPattern
//
//  Created by haijunyan on 2020/4/5.
//  Copyright © 2020年 haijunyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Receiver : NSObject

//被服务对象(承载体)
@property(nonatomic,weak)UIView *clientView;

/**
 变暗
 @param pamameter  操作系数(幅度)
 */
- (void)makeDarker:(CGFloat)pamameter;

/**
 变亮
 @param parameter 操作系数(幅度)
 */
- (void)makeLighter:(CGFloat)parameter;

@end
