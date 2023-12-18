//
//  LRUMutableDictionary.h
//  LRU
//  上限阈值
//  Created by haijunyan on 2023/11/20.
//

#import <Foundation/Foundation.h>

@interface LRUMutableDictionary<__covariant KeyType, __covariant ObjectType> : NSObject
// maxCountLRU: LRU算法的启用阈值
- (instancetype)initWithMaxCountLRU:(NSUInteger)maxCountLRU;

//*****NSDictionary
@property (readonly) NSUInteger count;

- (NSEnumerator<KeyType> *)keyEnumerator;

- (void)enumerateKeysAndObjectsUsingBlock:(void (^)(KeyType key, ObjectType obj, BOOL *stop))block;

//*****NSMutableDictionary
- (void)removeObjectForKey:(KeyType)aKey;
- (void)setObject:(ObjectType)anObject forKey:(KeyType <NSCopying>)aKey;

- (void)removeAllObjects;
- (void)removeObjectsForKeys:(NSArray<KeyType> *)keyArray;

//*****LRUMutableDictionary
// 执行LRU算法，当访问的元素可能是被淘汰的时候，可以通过在block中返回需要访问的对象，会根据LRU机制自动添加到dictionary中
- (ObjectType)objectForKey:(KeyType)aKey returnEliminateObjectUsingBlock:(ObjectType (^)(BOOL maybeEliminate))block;

@end

