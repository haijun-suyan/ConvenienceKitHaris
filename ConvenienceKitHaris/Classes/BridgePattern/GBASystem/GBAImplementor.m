//
//  GBAImplementor.m
//  BridgePattern
//
//  Created by haijunyan on 2019/6/2.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import "GBAImplementor.h"

@implementation GBAImplementor

- (void)loadCommand:(EcommandType)command {
    switch (command) {
        case kUp:
            
            NSLog(@"GBA up");
            break;
            
        case kDown:
            
            NSLog(@"GBA down");
            break;
            
        case kLeft:
            
            NSLog(@"GBA left");
            break;
            
        case kRight:
            
            NSLog(@"GBA right");
            break;
            
        case kA:
            
            NSLog(@"GBA A");
            break;
            
        case kB:
            
            NSLog(@"GBA B");
            break;
            
        default:
            NSLog(@"GBA None");
            break;
    }
}

@end
