//
//  KVOViewController.m
//  ConvenienceKitHaris
//
//  Created by haijunyan on 2024/4/11.
//

#import "KVOViewController.h"
#import "Person.h"

@interface KVOViewController ()
@property(nonatomic,strong)Person* person;
@end

@implementation KVOViewController
static void * PersonNameContext = &PersonNameContext;
static void * PersonSexContext = &PersonSexContext;
static void * PersonAgeContext = &PersonAgeContext;
static void * PersonDataArrayContext = &PersonDataArrayContext;
static void * PersonDownloadProgressContext = &PersonDownloadProgressContext;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    self.person = [Person new];
    //初始化部分
    //待观察的目标属性的 初始化(不会触发监控协议回调事件observeValueForKeyPath)
    self.person.name = @"yanhaijun";
    [self.person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:PersonNameContext];

    self.person.sex = @"男";
    [self.person addObserver:self forKeyPath:@"sex" options:NSKeyValueObservingOptionNew context:PersonSexContext];

    self.person.age = 23;
    [self.person addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:PersonAgeContext];

    self.person.dataArray = [NSMutableArray arrayWithCapacity:0];
    [self.person addObserver:self forKeyPath:@"dataArray" options:NSKeyValueObservingOptionNew context:PersonDataArrayContext];

    self.person.downloadProgress = 0.001;
    [self.person addObserver:self forKeyPath:@"downloadProgress" options:NSKeyValueObservingOptionNew context:PersonDownloadProgressContext];


    //待观察的目标属性每被进行新的赋值操作(每次都会触发监控协议回调事件observeValueForKeyPath)
    //重新赋值部分
    self.person.name = @"zpy";
    self.person.sex = @"女";
    self.person.age = 45;
    [[self.person mutableArrayValueForKey:@"dataArray"] addObject:@"元素"];
    self.person.downloadProgress = 0.1;


}

//Mark--重写协议回调事件observeValueForKeyPath
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (context == PersonNameContext) {
        NSLog(@"keypath被观察的目标属性 == %@", keyPath);
        NSLog(@"object上层类实例 == %@", object);
        NSLog(@"change == %@", change);
        NSLog(@"change[NSKeyValueChangeNewKey]被观察的目标属性变化发生后新值 == %@", change[NSKeyValueChangeNewKey]);
    }else if (context == PersonSexContext){
        NSLog(@"keypath被观察的目标属性 == %@", keyPath);
        NSLog(@"object上层类实例 == %@", object);
        NSLog(@"change == %@", change);
        NSLog(@"change[NSKeyValueChangeNewKey]被观察的目标属性变化发生后新值 == %@", change[NSKeyValueChangeNewKey]);
    }else if (context == PersonAgeContext) {
        NSLog(@"keypath被观察的目标属性 == %@", keyPath);
        NSLog(@"object上层类实例 == %@", object);
        NSLog(@"change == %@", change);
        NSLog(@"change[NSKeyValueChangeNewKey]被观察的目标属性变化发生后新值 == %@", change[NSKeyValueChangeNewKey]);
    }else if (context == PersonDataArrayContext) {
        NSLog(@"keypath被观察的目标属性 == %@", keyPath);
        NSLog(@"object上层类实例 == %@", object);
        NSLog(@"change == %@", change);
        NSLog(@"change[NSKeyValueChangeNewKey]被观察的目标属性变化发生后新值 == %@", change[NSKeyValueChangeNewKey]);
    }else if (context == PersonDownloadProgressContext) {
        NSLog(@"keypath被观察的目标属性 == %@", keyPath);
        NSLog(@"object上层类实例 == %@", object);
        NSLog(@"change == %@", change);
        NSLog(@"change[NSKeyValueChangeNewKey]被观察的目标属性变化发生后新值 == %@", change[NSKeyValueChangeNewKey]);
    }else {
        NSLog(@"协议回调事件observeValueForKeyPath");
    }
}

- (void)dealloc {
    [self.person removeObserver:self forKeyPath:@"name" context:PersonNameContext];
    [self.person removeObserver:self forKeyPath:@"sex" context:PersonSexContext];
    [self.person removeObserver:self forKeyPath:@"age" context:PersonAgeContext];
    [self.person removeObserver:self forKeyPath:@"dataArray" context:PersonDataArrayContext];
    [self.person removeObserver:self forKeyPath:@"downloadProgress" context:PersonDownloadProgressContext];
}

//Mark--系统touchesBegan事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //待观察的目标属性每被进行新的赋值操作(每次都会触发监控协议回调事件observeValueForKeyPath)
    self.person.name = @"zpy";
    self.person.sex = @"女";
    self.person.age = 78;
    self.person.downloadProgress = 0.01;
    self.person.writtenData += 10;
    self.person.totalData = 100;
}

@end
