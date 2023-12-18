//
//  ClassModel.h
//  ProtoypePattern
//
//  Created by haijunyan on 2019/2/27.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import "BaseCopyObject.h"

@interface ClassModel : BaseCopyObject

@property (nonatomic, strong) NSString  *className;

@property (nonatomic, strong) NSArray   *students;

@end
