//
//  ThreadViewController.m
//  ConvenienceKitHaris
//
//  Created by haijunyan on 2023/9/26.
//
//  dispatch_barrier：调度栅栏事件
//  多线程位于同一个进程体系下面
//  多线程情况下多读单写
//  队列环境概念
//  dealloc 内存释放失败->内存无效耗费(内存泄漏触发闪退机制)
//  同一个线程签自身内部所管理的待执行指令的执行顺序是有序(由前往后)
//  是否需要激活其他的线程(已处于激活状态的线程/尚未激活的惰性线程)

#import "ThreadViewController.h"

@interface ThreadViewController ()

@end

@implementation ThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testGCD];
}

- (void)testGCD {
    //创建普通队列串行
    dispatch_queue_t serialQueue = dispatch_queue_create("串行", DISPATCH_QUEUE_SERIAL);
    //(普通队列)串行+同步
    [self syncTestWithQueue:serialQueue withBarrier:YES];

//    //主队列串行
//    dispatch_queue_t mainSerialQueue = dispatch_get_main_queue();
//    //(主队列)串行+同步
//    [self syncTestWithQueue:mainSerialQueue withBarrier:YES];

//    //主队列串行
//    dispatch_queue_t mainSerialQueue = dispatch_get_main_queue();
//    //(主队列)串行+异步
//    [self asyncTestWithQueue:mainSerialQueue withBarrier:YES];

//    //创建普通队列串行
//    dispatch_queue_t serialQueue = dispatch_queue_create("串行", DISPATCH_QUEUE_SERIAL);
//    //(普通队列)串行+异步
//    [self asyncTestWithQueue:serialQueue withBarrier:YES];

//    //创建普通队列并行
//    dispatch_queue_t concurrentQueue = dispatch_queue_create("并行", DISPATCH_QUEUE_CONCURRENT);
//    //同步+普通队列并行
//    [self syncTestWithQueue:concurrentQueue withBarrier:YES];

//    //创建普通队列并行
//    dispatch_queue_t concurrentQueue = dispatch_queue_create("并行", DISPATCH_QUEUE_CONCURRENT);
//    //异步+普通队列并行
//    [self asyncTestWithQueue:concurrentQueue withBarrier:YES];

//    //创建队列全局并行
//    dispatch_queue_t globalConcurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    //同步+全局队列并行
//    [self syncTestWithQueue:globalConcurrentQueue withBarrier:YES];

//    //创建队列全局并行
//    dispatch_queue_t globalConcurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    //异步+全局队列并行
//    [self asyncTestWithQueue:globalConcurrentQueue withBarrier:YES];

}

//矩阵：原矩阵、(逆)规则矩阵、目标矩阵、其他矩阵
//加密解密
- (void)encryptionAndDecryption {
    //加密解密采用同样的密钥规则本：对称
    //加密解密采用不同的密钥规则本：非对称
    //


}


//步+行组合(指令元素块block)
- (void)syncTestWithQueue:(dispatch_queue_t)queue withBarrier:(BOOL)barrier {

    NSLog(@"1");
    dispatch_sync(queue,^{
        //((普通队列)串行+同步):block事件自然完成之前(block事件内的所有指令执行完成之前)(block事件所在的整个c函数调用指令执行完成之前cpu不会处理所在的c函数调用指令往后的同级别调用指令)(block事件所在的整个c函数调用指令执行完成之后cpu继续处理所在的c函数调用指令往后的同级别调用指令)(block事件 内外待执行级别相同有序进行即可)
        //(主队列)串行+同步:block事件所在的整个c函数指令直接出现阻塞效果(类似断点)(阻塞即暂停在(当前)前方状态下即调用处c函数指令不会触发执行一直中断)(即block事件不会触发且后面的逻辑事件均不触发)
        //同步+(普通队列)并行  ：只激活原来的默认主main线程签(block事件外部与block事件所在的整个c函数调用指令同级别的其他同等指令的插入待执行级别等于block事件内的所有待执行指令的插入待执行级别)(block事件 内外待执行级别相同有序进行即可)
        //同步+全局队列并行:只激活原来的默认主main线程签(block事件外部与block事件所在的整个c函数调用指令同级别的其他同等指令的插入待执行级别等于block事件内的所有待执行指令的插入待执行级别)(block事件 内外待执行级别相同有序进行即可)
        //
        NSLog(@"start 1");
        sleep(3);
        NSLog(@"end 1");
        NSLog(@"NSThread1=%@",[NSThread currentThread]);
    });

    NSLog(@"2");
    dispatch_sync(queue, ^{
        NSLog(@"start 2");
        sleep(3);
        NSLog(@"end 2");
        NSLog(@"NSThread2=%@",[NSThread currentThread]);
    });

    NSLog(@"3");
    dispatch_sync(queue, ^{
        NSLog(@"start 3");
        sleep(3);
        NSLog(@"end 3");
        NSLog(@"NSThread3=%@",[NSThread currentThread]);
    });

    NSLog(@"4");
    dispatch_sync(queue, ^{
        NSLog(@"start 4");
        sleep(3);
        NSLog(@"end 4");
        NSLog(@"NSThread4=%@",[NSThread currentThread]);
    });
    NSLog(@"5");
    NSLog(@"NSThread=%@",[NSThread currentThread]);

    //多读单写
//    if (barrier) {
//        dispatch_barrier_sync(queue, ^{
//            //指令块block事件(栅栏函数事件本身)
//            NSLog(@"barrier start 1");
//            sleep(3);
//            NSLog(@"barrier end 1");
//            NSLog(@"NSThread5=%@",[NSThread currentThread]);
//        });
//        NSLog(@"6");
//        dispatch_sync(queue, ^{
//            NSLog(@"start 5");
//            sleep(3);
//            NSLog(@"end 5");
//            NSLog(@"NSThread6=%@",[NSThread currentThread]);
//        });
//        NSLog(@"7");
//    }



}

//步+行组合(指令元素块block)
- (void)asyncTestWithQueue:(dispatch_queue_t)queue withBarrier:(BOOL)barrier {
    NSLog(@"1");
    //调度命令码
    dispatch_async(queue, ^{
        //(异步+(普通队列)串行):block事件内的所有待执行指令全部插入一个异线程签(与主main线程签有区别的另外线程签)(block事件外部与block事件所在的整个c函数调用指令同级别的其他同等指令依旧有序插入主main线程(插入原来的默认线程签))
        //异步+(主队列)串行:只激活原来的默认主main线程签(block事件外部与block事件所在的整个c函数调用指令同级别的其他同等指令先插入主main线程签(在外部所有同级别的其他同等指令插入完成之后)再依次插入block事件内的所有待执行指令进入主main线程签)
        //异步+(普通队列)并行:整个c函数调用指令呈现异步并行的特征则调用处激活全新的线程签(插入当前c函数调用指令本身的block事件内的所有待执行指令)(block事件外部与block事件所在的整个c函数调用指令同级别的其他同等指令依旧有序插入主main线程(插入原来的默认线程签))
        //异步+(全局队列)并行:整个c函数调用指令呈现异步并行的特征则调用处激活全新的线程签(插入当前c函数调用指令本身的block事件内的所有待执行指令)(block事件外部与block事件所在的整个c函数调用指令同级别的其他同等指令依旧有序插入主main线程(插入原来的默认线程签))
        NSLog(@"start 1");
        sleep(3);
        NSLog(@"end 1");
        NSLog(@"NSThread1=%@",[NSThread currentThread]);
    });
    NSLog(@"2");
    dispatch_async(queue, ^{
        NSLog(@"start 2");
        sleep(3);
        NSLog(@"end 2");
        NSLog(@"NSThread2=%@",[NSThread currentThread]);
    });
    NSLog(@"3");
    dispatch_async(queue, ^{
        NSLog(@"start 3");
        sleep(3);
        NSLog(@"end 3");
        NSLog(@"NSThread3=%@",[NSThread currentThread]);
    });
    sleep(3);
    NSLog(@"4");

    NSLog(@"NSThread=%@",[NSThread currentThread]);

//    if (barrier) {
//        dispatch_barrier_async(queue, ^{
//            NSLog(@"barrier start 1");
//            sleep(3);
//            NSLog(@"barrier end 1");
//            NSLog(@"NSThread5=%@",[NSThread currentThread]);
//        });
//        NSLog(@"5");
//
//        dispatch_async(queue, ^{
//            NSLog(@"start 4");
//            sleep(3);
//            NSLog(@"end 4");
//            NSLog(@"NSThread6=%@",[NSThread currentThread]);
//        });
//        NSLog(@"6");
//
//
//    }



}

@end
