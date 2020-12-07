//
//  UIColor+Hex.h
//  TestDemoXib
//
//  Created by haijunyan on 2019/9/2.
//  Copyright © 2019 haijunyan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIColor (Hex)

/**
 16进制色彩
 @param hexColor @"000000"
 */
+(UIColor*)colorWithHexadecimalColorString: (NSString *)hexColor;

@end

