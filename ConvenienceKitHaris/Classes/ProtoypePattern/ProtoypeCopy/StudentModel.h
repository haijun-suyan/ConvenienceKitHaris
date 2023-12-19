//
//  StudentModel.h
//  ProtoypePattern
//
//  Created by haijunyan on 2017/2/26.
//  Copyright © 2017年 haijunyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudentModel : NSObject

@property (nonatomic, copy) NSString  *name;

@property (nonatomic, strong) NSNumber  *age;

@property (nonatomic, copy) NSString  *address;

@property (nonatomic, strong) NSNumber  *totalScore;

- (id)clone;

@end
