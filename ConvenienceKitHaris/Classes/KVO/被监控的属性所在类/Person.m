//
//  Person.m
//  KVODemo
//
//  Created by haijunyan on 2024/3/17.
//

#import "Person.h"

@implementation Person
- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

//Mark--((automaticallyNotifiesObserversOfName返回NO)不允许被自动监控的)属性被手动监控
//手动监控(改造setter事件)
- (void)setName:(NSString *)name {
    [self willChangeValueForKey:@"name"];
    if (_name != name) {
        _name = name;
    }
    //ToDo

    [self didChangeValueForKey:@"name"];
}


//Mark-- 重写回调automaticallyNotifiesObserversForKey
//YES:对应的属性允许被自动监控
//NO:对应的属性不允许被自动监控
+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
    if ([key isEqualToString:@"name"]) {
        return NO;
    } else if ([key isEqualToString:@"age"]) {
        return NO;
    }
    //默认YES
    return YES;
}

//Mark--对属性writtenData/totalData的监控归属在优先管控属性downloadProgress管控下则writtenData/totalData属性变化的响应信号勾连优先管控属性downloadProgress的协议回调
+ (NSSet <NSString *> *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
    NSSet * keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
    if ([key isEqualToString:@"downloadProgress"]) {
        NSArray* affectingKeys = @[@"totalData", @"writtenData"];
        keyPaths = [keyPaths setByAddingObjectsFromArray:affectingKeys];
    }
    return keyPaths;
}


@end
