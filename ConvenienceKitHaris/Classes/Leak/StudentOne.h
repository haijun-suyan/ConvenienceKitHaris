//
//  StudentOne.h
//  KeepThreadAlive
//
//  Created by haijunyan on 2024/4/9.
//

#import <Foundation/Foundation.h>
@class Teacher;

@interface StudentOne : NSObject
@property (nonatomic, weak) Teacher *teacher;
@end
