//
//  CustomView.m
//  ConvenienceKitHaris
//
//  Created by haijunyan on 2023/12/9.
//

#import "CustomView.h"
#import "Masonry.h"
typedef void(^BtnEventBlock)(UIButton*);
@interface CustomView ()
@property(nonatomic,strong)UIButton *btn;
@property(nonatomic,copy)BtnEventBlock btnBlock;
@property(nonatomic,copy)NSString *titleBtn;
@end

@implementation CustomView
-(instancetype)initWithFrame:(CGRect)frame Title:(NSString *)titleBtn Handler:(void (^)(UIButton*))handle{
    self = [super initWithFrame:frame];
    if (self) {
        if (titleBtn.length>0) {
            self.titleBtn = titleBtn;
        }else {
            self.titleBtn = @"测试";
        }
        [self neededEmbededView:frame];
        self.btnBlock = handle;
    }
    return self;
}
#pragma mark ----- AddConstraints
-(void)neededEmbededView:(CGRect)frame{
    [self addSubview:self.btn];
    self.btn.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
}

-(UIButton *)btn
{
    if (!_btn) {
        _btn = [[UIButton alloc]initWithFrame:CGRectZero];
        [_btn setTitle:self.titleBtn forState:UIControlStateNormal];
        [_btn setTitle:self.titleBtn forState:UIControlStateHighlighted];
        [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [_btn.titleLabel setFont: [UIFont systemFontOfSize:16]];
        _btn.layer.cornerRadius = 5.0;
        _btn.layer.borderWidth = 1.0;
        _btn.layer.masksToBounds = YES;
        [_btn addTarget:self action:@selector(btnDidClick:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _btn;
}

- (void)btnDidClick:(UIButton *)psender {
    if (self.btnBlock) {
        self.btnBlock(psender);
    }

}

//- (UIView *)view1{
//    if (!_view1) {
//        _view1 = [[UIView alloc] init];
//        _view1.backgroundColor = [UIColor cyanColor];
//    }
//    return _view1;
//}




@end
