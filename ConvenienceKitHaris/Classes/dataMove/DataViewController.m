//
//  同级库库间：1.不支持.h文件引入#import <SupportKitHJY/SupportKitHJY.h> 2.(单纯的)前向声明@class SupportTool;(不支持引用直接IMP/直接属性)
//
//  //此处协议属性delegate所指向的对象self是当前构造器
//  //此处会形成‘双强向’(采用弱化‘weak’)
//  self.delegate = self;


//  DataViewController.m
//  Pods
//
//  Created by haijunyan on 2024/4/19.
//

#import "DataViewController.h"
#import <BaseKitHJY/BaseKitHJY.h>
#import "FirstViewController.h"
//前向声明
@class SupportTool;
@class SupportViewController;
@interface DataViewController ()
@property(nonatomic,strong)id<UnitProtocol> delegate;

@property(nonatomic,strong)UIButton *btn;
@end

@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.btn];
    self.btn.frame = CGRectMake(50, 100, 200,50);

    [self podDataMoveByDelegate];
    //---------Block走不通--------

    //----------------单例--------------
    //写法4：
    [UnitObject shareInstance].name = @"海军颜";

}

-(UIButton *)btn {
    if (!_btn) {
        _btn = [[UIButton alloc]initWithFrame:CGRectZero];
        [_btn setTitle:@"通知" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_btn.titleLabel setFont: [UIFont systemFontOfSize:16]];
        _btn.layer.cornerRadius = 5.0;
        _btn.layer.borderWidth = 1.0;
        _btn.layer.masksToBounds = YES;
        [_btn addTarget:self action:@selector(btnDidClick:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _btn;
}

- (void)btnDidClick:(UIButton *)psender {
    Class STClass = NSClassFromString(@"SupportViewController");
    id STObject = [STClass new];
    [self.navigationController pushViewController:STObject animated:YES];
    //----------------Notification--------------
    //写法3：
    dispatch_async(dispatch_get_main_queue(), ^{
        //单例center
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        if (center) {
            //发送通知
            [center postNotificationName:@"Notification_Success" object:nil userInfo:@{@"key":@"444"}];
        }
    });

}

- (void)podDataMoveByDelegate {
    //---------------------delegate-----------------------------
    //(STClass间接类)只支持访问协议的间接IMP
    //写法1：
    Class STClass = NSClassFromString(@"SupportTool");
    id STObject1 = [STClass new];
    //STObject1(真正)表示‘SupportTool’间接实例(表面style为id(不支持访问直接属性/直接API))
    //STObject1(遵循协议)间接实例(间接访问间接实例中的协议属性/协议API)
    self.delegate = STObject1;
    //此处协议属性delegate所指向的对象是另外构造器
    //此处不会形成‘双强向’(采用常规‘strong’默认)
    if ([self.delegate respondsToSelector:@selector(doSomethingWithData:)]) {
        id valueRtn = [self.delegate doSomethingWithData:@"CKH库的数据"];
        NSLog(@"打印=%@",valueRtn);
    }
    //写法2：
    id STObject2 = [[UnitObject shareInstance] getInstanceLibrary:@"SupportTool"];
    self.delegate = STObject2;
    if ([self.delegate respondsToSelector:@selector(doSomethingWithData:)]) {
        id valueRtn = [self.delegate doSomethingWithData:@"CKH库的数据"];
        NSLog(@"打印=%@",valueRtn);
    }

}









@end
