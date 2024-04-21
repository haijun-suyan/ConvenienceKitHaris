//
//  同级库库间：1.不支持.h文件引入#import <SupportKitHJY/SupportKitHJY.h> 2.前向声明@class SupportTool;(不支持引用直接IMP)
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

//前向声明
//@class SupportTool;
@interface DataViewController ()
@property(nonatomic,strong)id<UnitProtocol> delegate;
@end

@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
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

    //写法3：


}





@end
