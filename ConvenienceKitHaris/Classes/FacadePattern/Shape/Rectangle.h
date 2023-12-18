//  处理逻辑特定类(某个方面特定辅助类)
//  Rectangle.h 特定类
//  FacadePattern
//
//  Created by haijunyan on 2019/2/27.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import "Shape.h"

@interface Rectangle : Shape

@property (nonatomic, assign) CGFloat  width;

@property (nonatomic, assign) CGFloat  height;

@end
