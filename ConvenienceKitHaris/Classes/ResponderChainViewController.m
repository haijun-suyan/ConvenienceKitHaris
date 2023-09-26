//  响应链 分析
//  ResponderChainViewController.m
//  DemoDemo
//  block事件内外(block本身内外分割)
//  Created by haijunyan on 2021/3/2.
//  Copyright © 2021 haijunyan. All rights reserved.


#import "ResponderChainViewController.h"
#import "UIView+Responder.h"
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
@interface ResponderChainViewController ()
@property(nonatomic,strong)UIView *view1;
@property(nonatomic,strong)UIView *view11;
@property(nonatomic,strong)UIView *view12;
@property(nonatomic,strong)UIView *view13;
@end

@implementation ResponderChainViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.view1];
    self.view1.frame = CGRectMake(10, 50,kScreenW*0.7, kScreenH*0.6);

    [self.view1 addSubview:self.view11];
    self.view11.frame = CGRectMake(0, 0, kScreenW*0.5, kScreenH*0.5);

    [self.view1 addSubview:self.view12];
    self.view12.frame = CGRectMake(0,0,kScreenW*0.5, kScreenH*0.5);

    [self.view1 addSubview:self.view13];
    self.view13.frame = CGRectMake(0, 0,kScreenW*0.5, kScreenH*0.5);

    UITapGestureRecognizer *tapGesRec1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizer1:)];
    [self.view1 addGestureRecognizer:tapGesRec1];

    UITapGestureRecognizer *tapGesRec11 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizer11:)];
    [self.view11 addGestureRecognizer:tapGesRec11];

    UITapGestureRecognizer *tapGesRec12 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizer12:)];
    [self.view12 addGestureRecognizer:tapGesRec12];

//    UITapGestureRecognizer *tapGesRec13 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizer13:)];
//    [self.view13 addGestureRecognizer:tapGesRec13];

    self.view13.userInteractionEnabled = YES;
    self.view12.userInteractionEnabled = YES;
    self.view11.userInteractionEnabled = YES;
    self.view1.userInteractionEnabled = YES;

//    NSLog(@"current=%@",[self.view13 currentViewControllerForView]);

}

- (void)tapGestureRecognizer1:(UIGestureRecognizer *)ges {
    NSLog(@"gestureRecognizer1");
}

- (void)tapGestureRecognizer11:(UIGestureRecognizer *)ges {
    NSLog(@"gestureRecognizer11");
}

- (void)tapGestureRecognizer12:(UIGestureRecognizer *)ges {
    NSLog(@"gestureRecognizer12");
}

- (void)tapGestureRecognizer13:(UIGestureRecognizer *)ges {
    NSLog(@"gestureRecognizer13");
}

- (UIView *)view1{
    if (!_view1) {
        _view1 = [[UIView alloc] init];
        _view1.backgroundColor = [UIColor cyanColor];
    }
    return _view1;
}

- (UIView *)view11{
    if (!_view11) {
        _view11 = [[UIView alloc] init];
        _view11.backgroundColor = [UIColor yellowColor];
    }
    return _view11;
}

- (UIView *)view12{
    if (!_view12) {
        _view12 = [[UIView alloc] init];
        _view12.backgroundColor = [UIColor brownColor];
    }
    return _view12;
}

- (UIView *)view13{
    if (!_view13) {
        _view13 = [[UIView alloc] init];
        _view13.backgroundColor = [UIColor blueColor];
    }
    return _view13;
}


- (void)dealloc {

}


@end
