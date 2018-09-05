//
//  MYYMyOrderClassModer.h
//  BaseFrame
//
//  Created by apple on 17/5/15.
//  Copyright © 2017年 济南联祥技术有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYYMyOrderClassModer : NSObject
//
@property (nonatomic, copy) NSString *proid;//商品Id
@property (nonatomic, copy) NSString *jxproid;//商品Id
@property (nonatomic, copy) NSString *type;//类型
@property (nonatomic, copy) NSString *orderid;//订单id
@property (nonatomic, copy) NSString *proname;//名称
@property (nonatomic, copy) NSString *count;//数量
@property (nonatomic, copy) NSString *price;//价格
@property (nonatomic, copy) NSString *autoname;//图片
@property (nonatomic, copy) NSString *specification;//
@property (nonatomic, copy) NSString *maintosec;//
@property (nonatomic, copy) NSString *prounitname;
@property (nonatomic, copy) NSString *secondtoremainder;
@property (nonatomic, copy) NSString *sectoremain;
/*
 autoname = "cce558e20e904171be91ca4f7ae9d91e.png";
 count = 1;
 maintosec = 10;
 price = 10;
 proid = 440;
 proname = "\U76d0\U9178\U5ba0\U53ef\U5eb7";
 prounitname = "\U7bb1";
 sectoremain = 10;
 specification = "\U4e00\U4ef610\U7bb110\U76d2";
 type = 3;
*/
@end
