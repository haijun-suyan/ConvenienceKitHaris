//
//  ClassModel.m
//  ProtoypePattern
//
//  Created by haijunyan on 2019/2/27.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import "ClassModel.h"

@implementation ClassModel

- (void)copyOperationWithObject:(ClassModel *)object {
    
    object.className = self.className;
    
    // 完成了深拷贝(完整的复制了集合里面的对象)
    object.students  = [[NSArray alloc] initWithArray:self.students copyItems:YES];
}

@end
