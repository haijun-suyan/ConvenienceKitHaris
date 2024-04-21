//
//  DataViewController.m
//  Pods
//
//  Created by haijunyan on 2024/4/19.
//

#import "DataViewController.h"
#import "SupportTool.h"
@interface DataViewController ()
@property(nonatomic,strong)id<UnitProtocol> delegate;
@end

@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];

    //此处协议属性delegate所指向的对象是另外构造器
    //此处不会形成‘双强向’(采用常规‘strong’默认)
    self.delegate = [SupportTool new];
    if ([self.delegate respondsToSelector:@selector(phoneCall)]) {
        [self.delegate phoneCall];
    }

    //此处协议属性delegate所指向的对象self是当前构造器
    //此处会形成‘双强向’(采用弱化‘weak’)
//    self.delegate = self;




    
}





@end
