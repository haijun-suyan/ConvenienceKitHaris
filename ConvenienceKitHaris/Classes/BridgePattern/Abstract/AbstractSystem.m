//
//  AbstractSystem.m
//  BridgePattern
//
//  Created by haijunyan on 2019/6/2.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import "AbstractSystem.h"


@implementation AbstractSystem
//聚合关联关系
- (void)command_up {//桥接事件API接口
    //抽象化分支和实现化分支桥接结构
    [self.implementor loadCommand:kUp];
}

- (void)command_down {
    
    [self.implementor loadCommand:kDown];
}

- (void)command_left {
    
    [self.implementor loadCommand:kLeft];
}

- (void)command_right {
    
    [self.implementor loadCommand:kRight];
}

- (void)command_a {
    
    [self.implementor loadCommand:kA];
}

- (void)command_b {
    
    [self.implementor loadCommand:kB];
}

//{空实例防闪退保护}
- (void)loadSystem {
}
@end
