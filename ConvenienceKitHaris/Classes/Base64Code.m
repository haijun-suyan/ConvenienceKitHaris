//
//  Base64Code.m
//  DemoDemo
//
//  Created by haijunyan on 2020/12/7.
//  Copyright © 2020 haijunyan. All rights reserved.
//

#import "Base64Code.h"

@implementation Base64Code
//base64字符串转NSData数据
+ (NSData *)dataFromBase64String:(NSString *)base64 {
    NSData *EncryptData;
    if ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0) {
        EncryptData = [[NSData alloc] initWithBase64EncodedString:base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    }else{
        EncryptData = [[NSData alloc] initWithBase64Encoding:base64];
    }
    return EncryptData;
}

//base64字符串转普通字符串
+ (NSString *)textStringFromBase64String:(NSString *)base64 {
    NSData *EncryptData;
    if ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0) {
        EncryptData = [[NSData alloc] initWithBase64EncodedString:base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    }else{
        EncryptData = [[NSData alloc] initWithBase64Encoding:base64];
    }
    NSString *textString = [[NSString alloc] initWithData:EncryptData encoding:NSUTF8StringEncoding];
    return textString;
}

//NSData数据转PDF文件(文件路径)
+ (NSDictionary *)pdfFromData:(NSData *)data {
    //查找Documents文件夹路径
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    //文件存储路径
    NSString *pathComponent = [NSString stringWithFormat:@"%@Share.pdf",[self dateTimeCurrent]];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:pathComponent];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:filePath]) {
        [fileManager removeItemAtPath:filePath error:nil];
    }
    //待存储内容写入文件
    [data writeToFile:filePath atomically:YES];
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:@[esString(filePath),esString(pathComponent)] forKeys:@[@"filePath",@"fileNm"]];
    return dict;
}

+ (NSString *)dateTimeCurrent {
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    //HH:24制;hh:12制
    [dateFormat setDateFormat:@"yyyyMMddHHmmss"];
    NSString * dateStr = [dateFormat stringFromDate:date];
    return dateStr;
}
@end
