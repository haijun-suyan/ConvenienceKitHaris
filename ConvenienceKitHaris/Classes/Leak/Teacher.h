//
//  Teacher.h
//  KeepThreadAlive
//
//  Created by haijunyan on 2024/4/9.
//

#import <Foundation/Foundation.h>
#import "StudentOne.h"

@interface Teacher : NSObject
@property (nonatomic, strong) StudentOne *student;
@end
