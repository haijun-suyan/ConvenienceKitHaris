//
//  PSPSystem.m
//  BridgePattern
//
//  Created by haijunyan on 2019/6/2.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import "PSPSystem.h"

@implementation PSPSystem

- (void)loadSystem {
    
    NSLog(@"PSPSystem");
}

- (void)command_X {
    
    [self.implementor loadCommand:KX];
}

- (void)command_O {
    
    [self.implementor loadCommand:KO];
}


@end
