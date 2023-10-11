//
//  NSObject+Associated.m
//  ConvenienceKitHaris
//
//  Created by haijunyan on 2023/10/9.
//

#import "NSObject+Associated.h"
#import <objc/runtime.h>

@implementation NSObject (Associated)
//分类结构中新增属性名必需手动定义间接读写事件及IMP
//(伪)变量内存 读写数据
//手动自定义setter事件及IMP
- (void)setName:(NSString *)name {
    //IMP执行体
    //数据 写入 (伪)变量
    objc_setAssociatedObject(self, @selector(name), name, OBJC_ASSOCIATION_RETAIN);
}

//手动自定义getter事件及IMP
- (NSString *)name
{
    //(伪)变量 读取 数据
    NSString *associatedOutObject = (NSString *)objc_getAssociatedObject(self,@selector(name));
    return associatedOutObject;
}

//*********************************************



//对象的关联(RT框架内 关联C函数)
- (void)objcAssociatedObject {
    //事件方法/事件函数的行参可以接受某种地址值&(XX)则底层行参遵循结构特征typeof(XX) *指针型符号(作用:在事件方法/事件函数本身的执行体内对XX符号赋有效值)
    //    static char * p = &overviewKey;//void *-子类->char * 多态概念
    //当overview手动释放(overview = nil名栈内存释放掉(正常情况下，overview名栈内存释放掉对应的内容堆内存不被持有也将销毁))时，由于关联策略指明了让数组array栈内存名通过策略方式对overview名栈内存原本持有的内容堆内存进行持有(此处index式持有)即overview名栈内存原本持有的内容堆内存依旧被等效字段名持有故相应的内容堆内存不会被销毁依旧存在。只有当数组array栈内存名也释放(array = nil)时相应的内容堆内存才会被销毁。

    //主(枝)(对象)
    NSArray *array = [NSArray array];
    //initWithFormat确保字符串可被销毁
    //目标(待关联)对象
    NSString *overview = [[NSString alloc] initWithFormat:@"%@",@"first ThreeNumbers"];
    //关联 指针键overviewKey(当前关联体系下的hash映射键)
    static char overviewKey;
    //OBJC_ASSOCIATION_RETAIN对象_关联_策略 持有
    //主(对象) 写入 (待关联)目标对象 (hash映射键底层写入)
    objc_setAssociatedObject(array, &overviewKey, overview, OBJC_ASSOCIATION_RETAIN);

    //读取目标对象(主(对象)/PKey)
    NSString *associatedOutObject = (NSString *)objc_getAssociatedObject(array,&overviewKey);
    NSLog(@"associatedOutObject=%@",associatedOutObject);

    //断开PKey关联(策略随意配置)(目标对象nil/PKey底层读取)
    objc_setAssociatedObject(array,&overviewKey,nil, OBJC_ASSOCIATION_ASSIGN);
    //PKey关联断开后读取失败null
    NSString *associatedOutObjectClose = (NSString *)objc_getAssociatedObject(array,&overviewKey);
    NSLog(@"associatedOutObjectClose=%@",associatedOutObjectClose);

    //array主(对象)绑定的所有关联指针键都断开(array主(对象)不存在任何指针键即主(对象)不再持有任何目标对象(array恢复至原始状态))
    objc_removeAssociatedObjects(array);
}

//表 关联着 字符串
- (void)arrayAssociatedStr:(NSString *)overview Array:(NSArray *)array PKey:(const void * )pkey {
    //array主(对象)
    //关联键&overviewKey(PKey)
    //OBJC_ASSOCIATION_RETAIN(对象_关联_持有)
    objc_setAssociatedObject(array, pkey, overview, OBJC_ASSOCIATION_RETAIN);
}
//表中 读取所关联的 字符串
- (NSString *)strFromArray:(NSArray *)array PKey:(const void * )pkey {
    NSString *associatedOutObject = (NSString *)objc_getAssociatedObject(array,pkey);
    return associatedOutObject;
}
//主对象 关联 目标对象
- (void)objtAssociatedObject:(id)overview Object:(id)object PKey:(const void * )pkey {
    objc_setAssociatedObject(object, pkey, overview, OBJC_ASSOCIATION_RETAIN);
}
//主对象中 读取所关联的 目标对象
- (id)objtFromObject:(id)object PKey:(const void * )pkey {
    id associatedOutObject = objc_getAssociatedObject(object,pkey);
    return associatedOutObject;
}

@end
