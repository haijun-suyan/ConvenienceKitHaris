//  监测辅助类
//  Monitor1.m
//  KeepThreadAlive
//  关键1：主RunLoop中添加_observer
//  关键2：子RunLoop中添加Timer(环路定时器间隔0.01s重触检测事件）
//  Created by haijunyan on 2023/12/12.
//

#import "Monitor1.h"
#import <CrashReporter/CrashReporter.h>

@interface Monitor1 ()
@property(strong,nonatomic)NSThread *monitorThread;
@property(strong,nonatomic)NSDate *startDate;
//是否正在执行任务
@property(assign,nonatomic,getter=isExcuting)BOOL excuting;
@end

@implementation Monitor1
{
    CFRunLoopObserverRef _observer;//observer
    CFRunLoopTimerRef _timer;//定时器
}

//单例
+ (instancetype)shareInstance {
    static Monitor1 *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        instance.monitorThread = [[NSThread alloc] initWithTarget:self selector:@selector(monitorThreadEntryPoint) object:nil];
        [instance.monitorThread start];
    });
    return instance;
}

//启动loop对象，手动唤醒所属子线程(保活线程)
+ (void)monitorThreadEntryPoint {
    @autoreleasepool {
        [[NSThread currentThread] setName:@"Monitor"];
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
        [runLoop run];
    }
}

//启动对主线程的监测(往主RunLoop中添加_observer且往子RunLoop中添加环路定时器Timer(间隔0.01s重触检测事件))
- (void)startMonitor {
    if (_observer) {
        return;
    }
    //1.创建observer
    CFRunLoopObserverContext context = {0,(__bridge void*)self,NULL,NULL,NULL};
    _observer = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, &runLoopObserverCallBack, &context);
    //2.将observer添加到主线程的runLoop中
    CFRunLoopAddObserver(CFRunLoopGetMain(), _observer, kCFRunLoopCommonModes);
    //3.创建timer且添加到子线程的runLoop中
    [self performSelector:@selector(addTimerToMonitorThread) onThread:self.monitorThread withObject:nil waitUntilDone:NO modes:@[NSRunLoopCommonModes]];
}

//主环路下Observer监测主线程的状态变化(处理)
//随主线程在活跃和休眠间状态变化对应的主RunLoop也在kCFRunLoopBeforeTimers/kCFRunLoopBeforeSources/kCFRunLoopBeforeWaiting/kCFRunLoopAfterWaiting动态间轮流状态切换
static void runLoopObserverCallBack(CFRunLoopObserverRef observe,CFRunLoopActivity activity,void *info){
    Monitor1 *monitor = (__bridge Monitor1*)info;
    switch (activity) {
        case kCFRunLoopEntry:{
            NSLog(@"kCFRunLoopEntry");
            break;
        }
        case kCFRunLoopBeforeTimers:{
            NSLog(@"kCFRunLoopBeforeTimers");
            break;
        }
        case kCFRunLoopBeforeSources:{
            //**(主)环路BeforeSources(新一轮失去活跃的开始时刻)**
            NSLog(@"kCFRunLoopBeforeSources");
            monitor.startDate = [NSDate date];
            monitor.excuting = YES;
            break;
        }
        case kCFRunLoopBeforeWaiting:{
            NSLog(@"kCFRunLoopBeforeWaiting");
            monitor.excuting = NO;
            //耗时任务->block->数组
            if (monitor.moreConsumeEvent) {
                monitor.moreConsumeEvent(nil);
            }
            break;
        }
        case kCFRunLoopAfterWaiting:{
            NSLog(@"kCFRunLoopAfterWaiting");
            break;
        }
        case kCFRunLoopExit:{
            NSLog(@"kCFRunLoopExit");
            break;
        }
        default:
            break;
    }
}

#pragma mark -定时器
//Timer添加到子线程的runLoop中
- (void)addTimerToMonitorThread {
    if (_timer) {
        return;
    }
    //创建timer
    CFRunLoopRef currentRunLoop = CFRunLoopGetCurrent();
    CFRunLoopTimerContext context = {0,(__bridge void *)self,NULL,NULL,NULL};
    _timer = CFRunLoopTimerCreate(kCFAllocatorDefault, 0.01, 0.01, 0, 0, &runLoopTimerCallBack, &context);
    //Timer添加到子线程的runLoop中
    CFRunLoopAddTimer(currentRunLoop, _timer, kCFRunLoopCommonModes);
}

//子线程管理的子API事件中(可间接捕获主线程状态信息)
static void runLoopTimerCallBack(CFRunLoopTimerRef timer,void *info) {
    Monitor1 *monitor = (__bridge Monitor1*)info;
    if (!monitor.isExcuting) {//runLoop已进入休眠(kCFRunLoopBeforeWaiting)
        return;
    }
    //若主线程恰存在待执行的UI渲染任务且该(子)loop的执行行为至现在还在执行占用中则计算时间差(从kCFRunLoopBeforeSources状态至当前时刻的时间差即excuteTime)
    //**(子)loop执行占用中**
    //间接捕获主线程状态信息
    NSTimeInterval excuteTime = [[NSDate date] timeIntervalSinceDate:monitor.startDate];
    NSLog(@"定时器：当前所在线程%@;主线程失活时长%f秒",[NSThread currentThread],excuteTime);
    //环路定时器Timer间隔0.01s重执行1次，若isExcuting状态YES且excuteTime大于业务阈值0.01(阈值的参考取决于业务的复杂度和应用场景)则暗示主线程出现卡顿现象即保存堆栈信息便于后期优化
    if (excuteTime>=0.01) {
        NSLog(@"主线程卡顿时长%f秒",excuteTime);
        [monitor handleStackInfo];
    }
}

#pragma mark - PLCrash
- (void)handleStackInfo {
    PLCrashReporterConfig *config = [[PLCrashReporterConfig alloc] initWithSignalHandlerType:PLCrashReporterSignalHandlerTypeBSD symbolicationStrategy:PLCrashReporterSymbolicationStrategyAll];
    PLCrashReporter *crashReporter = [[PLCrashReporter alloc] initWithConfiguration:config];
    NSData *data = [crashReporter generateLiveReport];
    PLCrashReport *reporter = [[PLCrashReport alloc] initWithData:data error:NULL];
    //(格式化)(卡顿的堆栈信息)字符串
    NSString *report = [PLCrashReportTextFormatter stringValueForCrashReport:reporter withTextFormat:PLCrashReportTextFormatiOS];
    //上传卡顿日志文件
    NSLog(@"UI卡顿产生(堆栈信息): \n %@",report);
}

@end
