//
//  DarkerCommand.m
//  CommandPattern
//
//  Created by haijunyan on 2020/4/5.
//  Copyright © 2020年 haijunyan. All rights reserved.
//  乙方助理

#import "DarkerCommand.h"

@interface DarkerCommand()

@property (nonatomic, weak) Receiver *receiver;
@property (nonatomic, assign) CGFloat   parameter;


@end

@implementation DarkerCommand

- (instancetype)initWithReceiver:(Receiver *)receiver parameter:(CGFloat)parameter {
    
    self = [super init];
    if (self) {
        
        self.receiver = receiver;
        self.parameter = parameter;
    }
    
    return self;
}

- (void)excute {
    
    [self.receiver makeDarker:self.parameter];
}

- (void)rollBackExcute {
    
    [self.receiver makeLighter:self.parameter];
}


@end
