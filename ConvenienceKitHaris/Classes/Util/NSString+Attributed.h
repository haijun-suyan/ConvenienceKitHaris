//
//  NSString+Attributed.h
//  SRCBBank
//
//  Created by haijunyan on 2020/12/8.
//  Copyright © 2020 haijunyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Attributed)
/**
*  特征字符串
*
*  @return 返回特征字符串
*/
+ (NSAttributedString *)getAttributeWith:(id)sender
        string:(NSString *)string
     orginFont:(CGFloat)orginFont
    orginColor:(UIColor *)orginColor
 attributeFont:(CGFloat)attributeFont
                          attributeColor:(UIColor *)attributeColor;
@end
