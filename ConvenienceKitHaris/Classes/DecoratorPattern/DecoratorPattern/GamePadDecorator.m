//
//  GamePadDecorator.m
//  DecoratorPattern
//
//  Created by haijunyan on 2019/2/28.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import "GamePadDecorator.h"
#import "GamePad.h"

@interface GamePadDecorator ()

@property (nonatomic, strong) GamePad *gamePad;

@end


@implementation GamePadDecorator

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        self.gamePad = [[GamePad alloc] init];
    }
    
    return self;
}

- (void)up {
    
    [self.gamePad up];
}

- (void)down {
    
    [self.gamePad down];
}

- (void)left {
    
    [self.gamePad left];
}

- (void)right {
    
    [self.gamePad right];
}

- (void)select {
    
    [self.gamePad select];
}

- (void)start {
    
    [self.gamePad start];
}

- (void)commandA {
    
    [self.gamePad commandA];
}

- (void)commandB {
    
    [self.gamePad commandB];
}

- (void)commandX {
    
    [self.gamePad commandX];
}

- (void)commandY {
    
    [self.gamePad commandY];
}

- (void)cheat {
    [self up];
    [self down];
    [self up];
    [self down];
    [self left];
    [self right];
    [self left];
    [self right];
    [self commandA];
    [self commandB];
    [self commandA];
    [self commandB];
}
@end
