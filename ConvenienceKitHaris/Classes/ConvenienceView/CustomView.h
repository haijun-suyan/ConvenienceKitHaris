//
//  CustomView.h
//  ConvenienceKitHaris
//
//  Created by haijunyan on 2023/12/9.
//

#import <UIKit/UIKit.h>

@interface CustomView : UIView
-(instancetype)initWithFrame:(CGRect)frame Title:(NSString *)titleBtn Handler:(void (^)(UIButton*))handle;
@end


