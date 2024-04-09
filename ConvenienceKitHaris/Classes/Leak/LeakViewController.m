//
//  LeakViewController.m
//  KeepThreadAlive

//  Created by haijunyan on 2024/4/9.
//  循环引用(1和2组合(必需))：1.(业务层)相互访问 + 2.促使彼此引用计数值均增大
//  循环引用>双方均内存溢出(泄漏)
//  默认情况下单向访问
//  weak弱引用属性/变量
//  (默认‘强引用’)strong：访问的同时还增强了目前内存区本身绑定的自动引用计数值(ARC)
// (循环引用)场景 > 内存泄漏：解决方案‘破环掉循环’
//  UIViewController默认对NSNotificationCenter(订阅式中心）进行‘强向’> 中心的块IMP内采用weak弱化
//  UIViewController默认对协议回调IMP进行‘强向’> delegate采用weak弱化
//  TestBloc块IMP对IMP内涉及到的对象实例默认进行(强)引用

#import "LeakViewController.h"
#import "StudentOne.h"
#import "Teacher.h"

typedef void(^TestBlock)(void);

@interface LeakViewController ()
@property(nonatomic, copy) TestBlock blockTest;
@end

@interface LeakViewController ()
{
    Teacher *_teacher;
    StudentOne *_student;
}
@end

@implementation LeakViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //(循环引用(双向访问并双‘强’))场景1 > 内存泄漏
    NSMutableArray *arr1 = [NSMutableArray array];
    NSMutableArray *arr2 = [NSMutableArray array];
//    [arr1 addObject:arr2];
//    [arr2 addObject:arr1];

    //弱化(操作)
    __weak typeof(arr1) weakArr1 = arr1;
//    [weakArr1 addObject:arr2];
//    [arr2 addObject:weakArr1];
    //NSMutableArray本身期望添加强内存对象(弱化可能失效)

    //弱化(操作)
    NSPointerArray *arrP1 = [[NSPointerArray alloc] initWithOptions:NSPointerFunctionsWeakMemory];
    NSPointerArray *arrP2 = [[NSPointerArray alloc] initWithOptions:NSPointerFunctionsWeakMemory];
    [arrP1 addPointer:(__bridge void * _Nullable)(arrP2)];
    [arrP2 addPointer:(__bridge void * _Nullable)(arrP1)];

    //(循环引用)场景2 > 内存泄漏
    //当返回上级页后Teacher/StudentOne中dealloc事件的IMP未触发(_student/_teacher实例并未释放)
    _student = [[StudentOne alloc]init];
    _teacher = [[Teacher alloc]init];
//    _student.teacher = _teacher;
//    _teacher.student = _student;

    //(双方访问彼此内存的情况下)弱化(其中1个属性/变量)(操作)
    //将Student或Teacher构造器中的次级teacher/student属性的任意一个weak
    //比如通过weak声明‘弱引用属性teacher’
    //‘弱引用属性teacher’不会增强表达式右侧的‘_teacher实例的内存区’里面本身绑定的自动引用计数值(ARC)
    //‘弱引用属性teacher’对右侧的‘_teacher实例的内存区’只访问不增强(右侧内存区的)自动引用计数值(ARC)
    //-[LeakViewController dealloc]>-[Teacher dealloc]>相互结构对被破坏了(避免了循环引用)>-[StudentOne dealloc]
    _student.teacher = _teacher;
    _teacher.student = _student;


    //self(强)引用了blockTest
    //blockTest会对blockTestIMP内涉及到的对象实例self进行(强)引用
    //(循环引用)场景3 > 内存泄漏
//    self.blockTest = ^ {
//            self.view.backgroundColor = [UIColor redColor];
//        };

    //弱化(操作)
    __weak typeof(self) weakSelf = self;
    self.blockTest = ^ {
        weakSelf.view.backgroundColor = [UIColor redColor];
        };



    //  UIViewController默认对NSNotificationCenter(订阅式中心）进行‘强向’> 中心的块IMP内采用weak弱化
    //UIViewController->center  center -> block -> UIViewController
    //(循环引用)场景4
    NSNotificationCenter* center = [NSNotificationCenter defaultCenter];
    NSOperationQueue *mainQuene =[NSOperationQueue mainQueue];
//    [center addObserverForName:UIKeyboardWillShowNotification
//                        object:nil
//                        queue:mainQuene
//                    usingBlock:^(NSNotification *note) {
//        self.view.backgroundColor = [UIColor redColor];
//                        }];
    //弱化(操作)
    [center addObserverForName:UIKeyboardWillShowNotification
                        object:nil
                        queue:mainQuene
                    usingBlock:^(NSNotification *note) {
        weakSelf.view.backgroundColor = [UIColor redColor];
                        }];

}

- (void)dealloc {
    NSLog(@"%s",__func__);
}


@end
