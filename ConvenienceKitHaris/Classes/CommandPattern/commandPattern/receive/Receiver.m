//
//  Receiver.m
//  CommandPattern
//
//  Created by haijunyan on 2020/4/5.
//  Copyright © 2020年 haijunyan. All rights reserved.
//

#import "Receiver.h"

@interface Receiver ()
@property (nonatomic, assign) CGFloat hud;
@property (nonatomic, assign) CGFloat saturation;
@property (nonatomic, assign) CGFloat brightness;
@property (nonatomic, assign) CGFloat alpha;

@end

@implementation Receiver
- (void)setClientView:(UIView *)clientView {
    if (_clientView != clientView) {
        _clientView = clientView;
    }
    UIColor *color = _clientView.backgroundColor;
    //事件行参为指针型(底层实现堆内存的写入上层读取调用)
    //事件函数调用后字段名hud/saturation/brightness/alpha已被有效赋值
    [color getHue:&_hud saturation:&_saturation brightness:&_brightness alpha:&_alpha];
}

- (void)makeDarker:(CGFloat)pamameter {
    _brightness -= pamameter;
    _brightness  = MAX(0,_brightness);
    _clientView.backgroundColor = [UIColor colorWithHue:_hud
                                             saturation:_saturation
                                             brightness:_brightness
                                                  alpha:_alpha];
}

- (void)makeLighter:(CGFloat)pamameter {
    _brightness += pamameter;
    _brightness  = MIN(1, _brightness);
    _clientView.backgroundColor = [UIColor colorWithHue:_hud
                                             saturation:_saturation
                                             brightness:_brightness
                                                  alpha:_alpha];
}


@end
