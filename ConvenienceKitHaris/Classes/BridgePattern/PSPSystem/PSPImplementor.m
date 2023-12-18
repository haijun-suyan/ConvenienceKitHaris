//
//  PSPImplementor.m
//  BridgePattern
//
//  Created by haijunyan on 2019/6/2.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import "PSPImplementor.h"

@implementation PSPImplementor

- (void)loadCommand:(EcommandType)command {
    
    switch (command) {
            
        case kUp:
            
            NSLog(@"PSP up");
            break;
            
        case kDown:
            
            NSLog(@"PSP down");
            break;
            
        case kLeft:
            
            NSLog(@"PSP left");
            break;
            
        case kRight:
            
            NSLog(@"PSP right");
            break;
            
        case kA:
            
            NSLog(@"PSP A");
            break;
            
        case kB:
            
            NSLog(@"PSP B");
            break;
            
        case KO:
            
            NSLog(@"PSP O");
            break;
            
        case KX:
            
            NSLog(@"PSP X");
            break;
            
        default:
            NSLog(@"PSP None");
            break;
    }
}

@end
