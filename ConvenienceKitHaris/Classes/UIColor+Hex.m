//
//  UIColor+Hex.m
//  TestDemoXib
//
//  Created by haijunyan on 2019/9/2.
//  Copyright © 2019 haijunyan. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)
+(UIColor*)colorWithHexadecimalColorString: (NSString *)hexColor{
    NSString *cString = [[hexColor stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];

    if ([cString length] < 6) {

        return [UIColor clearColor];
    }

    if ([cString hasPrefix:@"0X"]){

        cString = [cString substringFromIndex:2];

    }

    if ([cString hasPrefix:@"#"]){
        cString = [cString substringFromIndex:1];
    }

    if ([cString length] != 6){

        return [UIColor clearColor];
    }

    NSRange range;

    range.location = 0;

    range.length = 2;

    //R、G、B

    NSString *rString = [cString substringWithRange:range];

    range.location = 2;

    NSString *gString = [cString substringWithRange:range];

    range.location = 4;

    NSString *bString = [cString substringWithRange:range];

    // Scan values

    unsigned int r, g, b;

    [[NSScanner scannerWithString:rString] scanHexInt:&r];

    [[NSScanner scannerWithString:gString] scanHexInt:&g];

    [[NSScanner scannerWithString:bString] scanHexInt:&b];

    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];

}
@end
