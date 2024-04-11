//
//  ViewController.m
//  patternOfAdapter
//
//  Created by haijunyan on 2019/2/16.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

#import "BusinessCardView.h"

@interface BusinessCardView ()

@property (nonatomic, strong) UILabel  *nameLabel;
@property (nonatomic, strong) UIView   *lineView;
@property (nonatomic, strong) UILabel  *phoneNumberLabel;

@end

@implementation BusinessCardView

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {

        [self setup];
    }
    
    return self;
}

- (void)setup {

    self.backgroundColor     = [UIColor whiteColor];
    self.layer.borderWidth   = 0.5f;
    self.layer.shadowOpacity = 0.5f;
    self.layer.shadowOffset  = CGSizeMake(5, 5);
    self.layer.shadowRadius  = 1.f;
    self.layer.shadowColor   = [UIColor grayColor].CGColor;
    
    
    self.nameLabel      = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 150, 25)];
    self.nameLabel.font = [UIFont systemFontOfSize:20.f];
    [self addSubview:self.nameLabel];
    
    
    self.lineView                 = [[UIView alloc] initWithFrame:CGRectMake(0, 45, 200, 5)];
    [self addSubview:self.lineView];
    
    
    self.phoneNumberLabel               = [[UILabel alloc] initWithFrame:CGRectMake(41, 105, 150, 20)];
    self.phoneNumberLabel.textAlignment = NSTextAlignmentRight;
    self.phoneNumberLabel.font          = [UIFont systemFontOfSize:16.f];
    [self addSubview:self.phoneNumberLabel];
}

//id结构的变量名遵循协议规范BusinessCardAdapterProtocol
//函行参可以视为临时性变量名(声明)
//id风格临时性变量名:(多态机制)可以持有任何实例对象
//此处因为协议的存在故所持有的任何实例对象必须是遵循协议的实例对象
- (void)loadData:(id <BaseAdapterAsisProtocol>)data {
    //[data name]:此处name对应着协议成员函数本身实例调用的返回值
    self.name        = [data name];
    self.lineColor   = [data lineColor];
    self.phoneNumber = [data phoneNumber];
}






#pragma mark - 重写setter,getter方法
@synthesize name        = _name;
@synthesize lineColor   = _lineColor;
@synthesize phoneNumber = _phoneNumber;

- (void)setName:(NSString *)name {
    
    _name           = name;
    _nameLabel.text = name;
}

- (NSString *)name {

    return _name;
}

- (void)setLineColor:(UIColor *)lineColor {

    _lineColor                = lineColor;
    _lineView.backgroundColor = _lineColor;
}

- (UIColor *)lineColor {

    return _lineColor;
}

- (void)setPhoneNumber:(NSString *)phoneNumber {

    _phoneNumber           = phoneNumber;
    _phoneNumberLabel.text = phoneNumber;
}

- (NSString *)phoneNumber {

    return _phoneNumber;
}

@end
