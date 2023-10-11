//
//  NSObject+Associated.h
//  ConvenienceKitHaris
//  列表关联 (伪)KeyObject键对象映射对
//  Created by haijunyan on 2023/10/9.
//

#import <Foundation/Foundation.h>

@interface NSObject (Associated)
//分类新增属性名
@property(nonatomic,copy)NSString *name;




//RT框架内 C关联函数(对象的关联)
- (void)objcAssociatedObject;
//表 关联着 字符串
- (void)arrayAssociatedStr:(NSString *)overview Array:(NSArray *)array PKey:(const void * )pkey;
//表中 读取所关联的 字符串
- (NSString *)strFromArray:(NSArray *)array PKey:(const void * )pkey;
//主对象 关联 目标对象
- (void)objtAssociatedObject:(id)overview Object:(id)object PKey:(const void * )pkey;
//主对象中 读取所关联的 目标对象
- (id)objtFromObject:(id)object PKey:(const void * )pkey;
@end
