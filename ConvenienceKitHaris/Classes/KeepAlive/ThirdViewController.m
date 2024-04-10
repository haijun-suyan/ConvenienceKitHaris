//  loop环路方式：
//  NSThread针对  线程
//  NSOperation针对 线程池
//  GCD 针对 队列+线程池
//  条件锁方式：
//  NSCondition条件锁
//  ThirdViewController.m
//  KeepThreadAlive
//
//  Created by haijunyan on 2023/12/11.
//  runloop组成：Mode->sources/timer /observer

//  observer监测仪(卡顿监测)
//  CPU(逻辑)中央处理器
//  GPU渲染处理器
//  UI卡顿和设备硬件相关CPU/GPU
//  CPU性能的影响因素：本身硬件、IO任务、过多线程抢占CPU资源、温度过高降频
//  GPU性能的影响因素：本身硬件、显存频率、渲染算法、大计算量
//  卡顿监测？fps、60hz(59.94/s)、ping、runloop
#import "ThirdViewController.h"
#import "ConvenienceKitHaris.h"
#import "TestThread.h"
@interface ThirdViewController ()
@property(strong,nonatomic)TestThread *thread;
@property(assign,nonatomic,getter=isStoped)BOOL stopped;
@end

@implementation ThirdViewController
//NSThread 线程保活
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    CustomView *cv = [[CustomView alloc] initWithFrame:CGRectMake(100, 200, 100, 50) Title:@"启动runLoop" Handler:^(UIButton *psender) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            self.stopped = NO;
            __weak typeof(self) weakSelf = self;
            self.thread = [[TestThread alloc] initWithBlock:^{
                NSLog(@"startRun");
                [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
                while (!weakSelf.isStoped) {
                    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
                }
                NSLog(@"stop");
            }];
            self.thread.name = @"可控线程";
            [self.thread start];
        });

    }];
    [self.view addSubview:cv];

    CustomView *cv1 = [[CustomView alloc] initWithFrame:CGRectMake(100, 300, 100, 50) Title:@"执行任务" Handler:^(UIButton *psender) {
        [self performSelector:@selector(addSubThreadTask) onThread:self.thread withObject:nil waitUntilDone:NO];
    }];
    [self.view addSubview:cv1];

    CustomView *cv2 = [[CustomView alloc] initWithFrame:CGRectMake(100, 400, 100, 50) Title:@"停止runLoop" Handler:^(UIButton *psender) {
        [self performSelector:@selector(stopThread) onThread:self.thread withObject:nil waitUntilDone:YES];
    }];
    [self.view addSubview:cv2];


}
//子线程 待执行任务
- (void)addSubThreadTask {
    NSLog(@"%s %@",__func__,[NSThread currentThread]);
}

//停止子线程的runLoop
- (void)stopThread {
    //设置标识为NO
    self.stopped = YES;

    //runLoop单次停止(伴随线程销毁)
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.thread = nil;//strong修饰，此处需nil手动释放
    NSLog(@"%s %@",__func__,[NSThread currentThread]);
}

//GCD 线程保活
- (void)GCDKeepAlive {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        [runLoop addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
        [runLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    });
}

//NSCondition条件锁 线程保活





@end
