//  
//  LRUMutableDictionary.m
//  LRU
//
//  Created by haijunyan on 2023/11/20.
//

#import "LRUMutableDictionary.h"
// 定义一个开始准备启动LRU的值，当 (MaxCount - CurCount < LRU_RISK_COUNT) 时才启动 LRU
#define LRU_RISK_COUNT 100

@interface LRUMutableDictionary()
@property (nonatomic, strong) NSMutableDictionary *dict;    // 存储数据的字典(链表平替)
@property (nonatomic, strong) NSMutableArray *arrayForLRU;  // 存放LRU的数组(hash平替)

@property (nonatomic, assign) NSUInteger maxCountLRU;       // 最大存储值，存储量超出这个值，启动LRU淘汰算法
@property (nonatomic, assign) BOOL isOpenLRU;               // 是否开启LRU算法，如果存储量远低于最大存储值时，其实没有必要开启LRU算法
@end

@implementation LRUMutableDictionary
- (instancetype)initWithMaxCountLRU:(NSUInteger)maxCountLRU
{
    self = [super init];
    if (self) {
        _dict = [[NSMutableDictionary alloc] initWithCapacity:maxCountLRU];
        _arrayForLRU = [[NSMutableArray alloc] initWithCapacity:maxCountLRU];
        _maxCountLRU = maxCountLRU;
    }
    return self;
}
#pragma mark - NSDictionary

- (NSUInteger)count
{
    return [_dict count];
}

- (NSEnumerator *)keyEnumerator
{
    return [_dict keyEnumerator];
}

- (id)objectForKey:(id)aKey
{
    return [self objectForKey:aKey returnEliminateObjectUsingBlock:^id(BOOL maybeEliminate) {
        return nil;
    }];
}

- (void)enumerateKeysAndObjectsUsingBlock:(void (^)(id, id, BOOL *))block
{
    [_dict enumerateKeysAndObjectsUsingBlock:block];
}

#pragma mark - NSMutableDictionary

- (void)removeObjectForKey:(id)aKey
{
    [_dict removeObjectForKey:aKey];
    [self _removeObjectLRU:aKey];
}

- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    BOOL isExist = ([_dict objectForKey:aKey] != nil);
    [_dict setObject:anObject forKey:aKey];

    if (isExist) {
        [self _adjustPositionLRU:aKey];
    } else {
        [self _addObjectLRU:aKey];
    }
}

- (void)removeAllObjects
{
    [_dict removeAllObjects];
    [self _removeAllObjectsLRU];
}

- (void)removeObjectsForKeys:(NSArray *)keyArray
{
    if (keyArray.count > 0) {
        [_dict removeObjectsForKeys:keyArray];
        [self _removeObjectsLRU:keyArray];
    }
}

#pragma mark - LRUMutableDictionary

- (id)objectForKey:(id)aKey returnEliminateObjectUsingBlock:(id (^)(BOOL))block
{
    id object = [_dict objectForKey:aKey];
    if (object) {
        [self _adjustPositionLRU:aKey];
    }
    if (block) {
        BOOL maybeEliminate = object ? NO : YES;
        id newObject = block(maybeEliminate);
        if (newObject) {
            [self setObject:newObject forKey:aKey];
            return [_dict objectForKey:aKey];
        }
    }
    return object;
}

#pragma mark - LRU

- (void)_adjustPositionLRU:(id)anObject
{
    if (_isOpenLRU) {
        NSUInteger idx = [_arrayForLRU indexOfObject:anObject];
        if (idx != NSNotFound) {
            [_arrayForLRU removeObjectAtIndex:idx];
            [_arrayForLRU insertObject:anObject atIndex:0];
        }
    }
}

- (void)_addObjectLRU:(id)anObject
{
    if (!_isOpenLRU && [self isNeedOpenLRU:_dict.count]) {
        // 如果原来没有开启 LRU，现在增加一个元素之后达到了存储量临界条件，则开启，一次性将所有的Key导入
        [_arrayForLRU removeAllObjects];
        [_arrayForLRU addObjectsFromArray:_dict.allKeys];
        [_arrayForLRU removeObject:anObject];
        _isOpenLRU = YES;
    }

    if (_isOpenLRU) {
        [_arrayForLRU insertObject:anObject atIndex:0];
        // 当超出LRU算法限制之后，将最不常使用的元素淘汰
        if ((_maxCountLRU > 0) && (_arrayForLRU.count > _maxCountLRU)) {
            [_dict removeObjectForKey:[_arrayForLRU lastObject]];
            [_arrayForLRU removeLastObject];

            // 【注意】这里不要直接调用下面这个方法，因为内部调用[_arrayForLRU removeObject:anObject];的时候，
            // 每次都将Array从头开始遍历到最后一个，这里既然已经知道是删除最后一个了，直接删除即可。
            // 使用下面这种方法会增加上百倍的耗时。
            // [self removeObjectForKey:[_arrayForLRU lastObject]];
        }
    }
}

- (void)_removeObjectLRU:(id)anObject
{
    if (_isOpenLRU) {
        [_arrayForLRU removeObject:anObject];

        if (![self isNeedOpenLRU:_arrayForLRU.count]) {
            [_arrayForLRU removeAllObjects];
            _isOpenLRU = NO;
        }
    }
}

- (void)_removeObjectsLRU:(NSArray *)otherArray
{
    if (_isOpenLRU) {
        [_arrayForLRU removeObjectsInArray:otherArray];

        if (![self isNeedOpenLRU:_arrayForLRU.count]) {
            [_arrayForLRU removeAllObjects];
            _isOpenLRU = NO;
        }
    }
}

- (void)_removeAllObjectsLRU
{
    if (_isOpenLRU) {
        [_arrayForLRU removeAllObjects];
        _isOpenLRU = NO;    // 清空全部元素了，一定可以关闭LRU
    }
}

- (BOOL)isNeedOpenLRU:(NSUInteger)count
{
    return (_maxCountLRU - count) < LRU_RISK_COUNT;
}

@end
