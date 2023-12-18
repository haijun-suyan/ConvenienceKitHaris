//
//  BaseCopyObject.m
//  ProtoypePattern
//
//  Created by haijunyan on 2019/2/27.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import "BaseCopyObject.h"

@implementation BaseCopyObject

- (id)copyWithZone:(NSZone *)zone {
    
    BaseCopyObject *copyObject = [[self class] allocWithZone:zone];
    
    // 赋值操作作业
    [self copyOperationWithObject:copyObject];
    
    return copyObject;
}

- (void)copyOperationWithObject:(id)object {
    
}


@end
