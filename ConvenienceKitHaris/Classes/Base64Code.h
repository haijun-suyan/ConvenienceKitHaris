//
//  Base64Code.h
//  DemoDemo
//
//  Created by haijunyan on 2020/12/7.
//  Copyright © 2020 haijunyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Base64Code : NSObject

/// base64字符串转NSData数据
+ (NSData *)dataFromBase64String:(NSString *)base64;
/// NSData数据转PDF文件(文件路径)
/// filePath:完整路径 fileNm:文件名
+ (NSDictionary *)pdfFromData:(NSData *)data;
///base64字符串转普通字符串
+ (NSString *)textStringFromBase64String:(NSString *)base64;
@end

