//
//  HarisUtil.h
//  DemoDemo
//
//  Created by haijunyan on 2020/12/7.
//  Copyright © 2020 haijunyan. All rights reserved.
//

#import <UIKit/UIKit.h>
//屏幕Width
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
//屏幕height
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


@interface HarisUtil : NSObject

@end

NSString *esString(id obj);
BOOL ESStringVal(NSString **var, id obj);
