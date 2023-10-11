//
//  Product.h
//  ConvenienceKitHaris
//
//  Created by haijunyan on 2023/10/11.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject
@property (nonatomic, copy) NSString *name;    //商品名字
@property (nonatomic, assign) float price;     //商品价格
//@property (nonatomic, strong) Factory *factory; //生产工厂

@end
