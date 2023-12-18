//
//  LighterCommand.m
//  CommandPattern
//
//  Created by haijunyan on 2020/4/5.
//  Copyright © 2020年 haijunyan. All rights reserved.
//  乙方助理

#import "LighterCommand.h"

@interface LighterCommand ()

@property (nonatomic, weak) Receiver *receiver;

@property (nonatomic, assign) CGFloat parameter;

@end

@implementation LighterCommand

- (instancetype)initWithReceiver:(Receiver *)receiver parameter:(CGFloat)parameter {
    self = [super init];
    if (self) {
        self.receiver = receiver;
        self.parameter = parameter;
    }
    return self;
}

- (void)excute {
    
    [self.receiver makeLighter:self.parameter];
}

- (void)rollBackExcute {
    
    [self.receiver makeDarker:self.parameter];
}


@end
