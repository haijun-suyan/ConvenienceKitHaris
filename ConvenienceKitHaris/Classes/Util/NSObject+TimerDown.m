//
//  NSObject+TimerDown.m
//  DemoDemo
//
//  Created by haijunyan on 2020/12/8.
//  Copyright © 2020 haijunyan. All rights reserved.
//

#import "NSObject+TimerDown.h"

@implementation NSObject (TimerDown)
- (void)timerDown:(UIButton *)btn buttonTitle:(NSString *)title{
    __block int timeout = 60;
    //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    //每秒执行一次
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);//每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){//倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面按钮显示 根据自己需求设置
                [btn setTitle:title forState:UIControlStateNormal];
                [btn setTitle:title forState:UIControlStateHighlighted];
                btn.userInteractionEnabled = YES;
            });
        }else{
            int seconds = timeout % 61;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [btn setTitle:[NSString stringWithFormat:@"%@s",strTime] forState:UIControlStateNormal];
                [btn setTitle:[NSString stringWithFormat:@"%@s",strTime] forState:UIControlStateHighlighted];
                btn.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}
@end
