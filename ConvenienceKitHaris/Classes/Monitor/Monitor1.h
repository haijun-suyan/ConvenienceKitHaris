//  监测卡顿信息
//  监测阶段
//  Monitor1.h
//  KeepThreadAlive
//
//  Created by haijunyan on 2023/12/12.
//

#import <Foundation/Foundation.h>
typedef void(^MoreConsumeEvent)(id);
@interface Monitor1 : NSObject
@property(nonatomic,copy)MoreConsumeEvent moreConsumeEvent;
+ (instancetype)shareInstance;
- (void)startMonitor;
@end
