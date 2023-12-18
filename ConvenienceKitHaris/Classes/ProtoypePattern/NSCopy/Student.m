//
//  Student.m
//  ProtoypePattern
//
//  Created by haijunyan on 2019/2/27.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import "Student.h"

@implementation Student

- (void)copyOperationWithObject:(Student *)object {
    
    object.name = self.name;
    
    object.age  = self.age;
}


@end
