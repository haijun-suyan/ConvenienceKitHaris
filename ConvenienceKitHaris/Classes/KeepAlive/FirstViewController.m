//
//  FirstViewController.m
//  KeepThreadAlive
//
//  Created by haijunyan on 2023/12/9.
//

#import "FirstViewController.h"
#import "ConvenienceKitHaris.h"
#import "TestThread.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    CustomView *cv = [[CustomView alloc]initWithFrame:CGRectMake(100, 200, 100, 50) Title:@"" Handler:^(UIButton *psender) {
        TestThread *thread = [[TestThread alloc] initWithTarget:self selector:@selector(doSomething) object:nil];
        [thread start];
    }];
    [self.view addSubview:cv];
    
}

//线程状态：销毁状态、存在且活跃状态、存在但休眠状态
//此处doSomething完成后销毁对应的子线程
- (void)doSomething {
    NSLog(@"start");
    NSLog(@"%s",__func__);
    NSLog(@"%@",[NSThread currentThread]);
    NSLog(@"====%@",[NSThread mainThread]);//number1
    [NSThread sleepForTimeInterval:10.0];

    //线程的组成：
    //key线程:valueloop
    NSLog(@"end");

}

@end
