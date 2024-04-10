//
//  Person.h
//  KVODemo
//
//  Created by haijunyan on 2024/3/17.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)NSInteger age;
@property(nonatomic,copy)NSString *sex;
@property(nonatomic,strong)NSMutableArray* dataArray;

@property(nonatomic,assign)float downloadProgress;
@property(nonatomic,assign)NSInteger writtenData;
@property(nonatomic,assign)NSInteger totalData;

@end
