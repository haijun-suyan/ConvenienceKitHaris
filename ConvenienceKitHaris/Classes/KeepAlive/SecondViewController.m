//
//  SecondViewController.m
//  KeepThreadAlive
//  备注：主线程默认自动活跃(即主线程不需要手动唤醒)
//  子线程默认处于休眠模型(需要手动唤醒所在的子线程)
//  所在子线程的保活即 启动loop对象手动唤醒 > 保活(针对 某特定线程>某特定loop对象)
//  Created by haijunyan on 2023/12/11.
//  NS和CF区别：NS更上层的封装更面向对象;CF源自CoreFoundation框架(纯C语言(**线程安全**))
//  环路单次启动/暂定 可控


#import "SecondViewController.h"
#import "ConvenienceKitHaris.h"
#import "TestThread.h"
@interface SecondViewController ()
{
    TestThread *thread;
}
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    CustomView *cv = [[CustomView alloc] initWithFrame:CGRectMake(100, 200, 100, 50) Title:@"保活线程" Handler:^(UIButton *psender) {
//        NSLog(@"==%@",[NSThread currentThread]);
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            self->thread = [[TestThread alloc] initWithTarget:self selector:@selector(doSomething) object:nil];
            [self->thread setName:@"保活线程"];
            [self->thread start];
        });
    }];
    [self.view addSubview:cv];

    CustomView *cv1 = [[CustomView alloc] initWithFrame:CGRectMake(100, 300, 100, 50) Title:@"执行任务" Handler:^(UIButton *psender) {
        [self performSelector:@selector(addSubThreadTask) onThread:self->thread withObject:nil waitUntilDone:NO];
    }];
    [self.view addSubview:cv1];


}

//子线程启动后，启动loop对象(手动唤醒所在的子线程)
//loop对象唤醒所在的线程步骤:1.loop对象获取 2.添加port 3.启动对象
//此处doSomething执行前线程处于存在但休眠状态；doSomething执行后线程处于存在且活跃状态(保活)
- (void)doSomething {
    @autoreleasepool {
        NSLog(@"%@",[NSThread currentThread]);
        //runloop组成：Mode->sources/timer /observer
        //电源sources/定时器timer元素(影响loop对象的启动及运行)：至少存在1个
        //**source0作用**:基于非系统port的用户行为事件(例如：处理手动触发事件(触摸、滑动、点击等))
        //source1作用:基于系统port的内核事件，主动唤醒loop对象
        //数据结构：
        //数据结构：(内存中存在字典结构：字典key设备machport/字典value：source1 )+source0数组列表(待处理的手动触发事件)
        //当前(线程相关的)环路对象((唤醒所在的线程))
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
//        NSLog(@"Loop添加前=%@",runLoop);
        //方案1:
        //添加设备machport(添加source1)
        [runLoop addPort:[NSMachPort port] forMode:NSRunLoopCommonModes];
        //方案2:
        //添加timer定时器
//        [runLoop addTimer:[NSTimer timerWithTimeInterval:3.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
//
//        }] forMode:NSRunLoopCommonModes];
        //方案3:
        //系统底层API
//        CFRunLoopAddSource(runLoop, CFRunLoopSourceRef source, NSRunLoopCommonModes);
//        NSLog(@"Loop添加后=%@",runLoop);
        //loop对象启动方式：1.无条件 2.时限 3.特定模式
//        [runLoop run];//循环
//        [runLoop runUntilDate:[NSDate distantFuture]];//循环
        //单次环路的启动
        [runLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        //环路单次启动后的命令码(可执行生效)
        NSLog(@"结束");
    }
}
//子线程 待执行任务
- (void)addSubThreadTask {
    NSLog(@"启动RunLoop后--%@",[NSRunLoop currentRunLoop].currentMode);
    NSLog(@"%@----子线程任务开始",[NSThread currentThread]);
    for (int i=0; i<3; i++) {
        [NSThread sleepForTimeInterval:5.0];
        NSLog(@"--子线程任务 %d",i);
    }
    NSLog(@"%@----子线程任务结束",[NSThread currentThread]);
    //单次环路对象的停止
    CFRunLoopStop([NSRunLoop currentRunLoop].getCFRunLoop);
}





@end
