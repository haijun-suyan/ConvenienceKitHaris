//
//  ProtoypeCopyProtocol.h
//  ProtoypePattern
//
//  Created by wupeng on 2017/2/26.
//  Copyright © 2017年 wupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ProtoypeCopyProtocol <NSObject>

@required

/**
 *  复制自己
 *
 *  @return 返回一个拷贝样本
 */
- (id)clone;

@end
