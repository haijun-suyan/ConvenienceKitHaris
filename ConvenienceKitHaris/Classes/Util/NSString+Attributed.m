//
//  NSString+Attributed.m
//  SRCBBank
//
//  Created by haijunyan on 2020/12/8.
//  Copyright © 2020 李培辉. All rights reserved.
//

#import "NSString+Attributed.h"

@implementation NSString (Attributed)
+ (NSAttributedString *)getAttributeWith:(id)sender
                                  string:(NSString *)string
                               orginFont:(CGFloat)orginFont
                              orginColor:(UIColor *)orginColor
                           attributeFont:(CGFloat)attributeFont
                          attributeColor:(UIColor *)attributeColor{
    __block NSMutableAttributedString *totalStr = [[NSMutableAttributedString alloc] initWithString:string];
    [totalStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"PingFangSC-Regular" size:orginFont] range:NSMakeRange(0,string.length)];
    [totalStr addAttribute:NSForegroundColorAttributeName value:orginColor range:NSMakeRange(0,string.length)];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:1.0f]; //设置行间距
    [paragraphStyle setAlignment:NSTextAlignmentLeft];
    [paragraphStyle setLineBreakMode:NSLineBreakByCharWrapping];
    [totalStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0,[totalStr length])];
    if ([sender isKindOfClass:[NSArray class]]) {
        __block NSString *oringinStr = string;
        __weak typeof(self) weakSelf = self;
        [sender enumerateObjectsUsingBlock:^(NSString *  _Nonnull str, NSUInteger idx, BOOL * _Nonnull stop) {
            NSRange range = [oringinStr rangeOfString:str];
            [totalStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"PingFangSC-Regular" size:attributeFont] range:range];
            [totalStr addAttribute:NSForegroundColorAttributeName value:attributeColor range:range];
            oringinStr = [oringinStr stringByReplacingCharactersInRange:range withString:[weakSelf getStringWithRange:range]];
        }];
    }else if ([sender isKindOfClass:[NSString class]]) {
        NSRange range = [string rangeOfString:sender];
        [totalStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"PingFangSC-Regular" size:attributeFont]  range:range];
        [totalStr addAttribute:NSForegroundColorAttributeName value:attributeColor range:range];
    }
    return totalStr;
}

+ (NSString *)getStringWithRange:(NSRange)range
{
    NSMutableString *string = [NSMutableString string];
    for (int i = 0; i < range.length ; i++) {
        [string appendString:@" "];
    }
    return string;
}
@end
