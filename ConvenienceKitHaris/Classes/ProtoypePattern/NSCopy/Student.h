//
//  Student.h
//  ProtoypePattern
//
//  Created by haijunyan on 2019/2/27.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import "BaseCopyObject.h"

@interface Student : BaseCopyObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) NSNumber *age;

@end
