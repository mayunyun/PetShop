//
//  JVShopcartFormat.h
//  JVShopcart
//
//  Created by AVGD-Jarvi on 17/3/23.
//  Copyright © 2017年 AVGD-Jarvi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JVShopcartFormatDelegate <NSObject>

@required
- (void)shopcartFormatRequestProductListDidSuccessWithArray:(NSMutableArray *)dataArray nsarry:(NSArray*)arr;
//- (void)shopcartFormatRequestProductListDidSuccessWithDictionary:(NSMutableDictionary *)dictionary;
- (void)shopcartFormatRequestgetOrderProductDidSuccessWithArray:(NSMutableArray *)dataArray nsarry:(NSArray*)arr;

- (void)shopcartFormatAccountForTotalPrice:(float)totalPrice
                                totalCount:(NSInteger)totalCount
                             isAllSelected:(BOOL)isAllSelected;

- (void)shopcartFormatSettleForSelectedProducts:(NSArray *)selectedProducts;

- (void)shopcartFormatWillDeleteSelectedProducts:(NSArray *)selectedProducts;
- (void)shopcartFormatHasDeleteAllProducts;


@end

@interface JVShopcartFormat : NSObject

@property (nonatomic, weak) id <JVShopcartFormatDelegate> delegate;

- (void)requestShopcartProductList;
- (void)requestShopgetOrderProduct;
- (void)selectProductAtIndexPath:(NSIndexPath *)indexPath isSelected:(BOOL)isSelected;
- (void)selectBrandAtSectionisSelected:(BOOL)isSelected;
- (void)changeCountAtIndexPath:(NSIndexPath *)indexPath count:(NSInteger)count;
- (void)deleteProductAtIndexPath:(NSIndexPath *)indexPath;
- (void)beginToDeleteSelectedProducts;
- (void)deleteSelectedProducts:(NSArray *)selectedArray;
- (void)starProductAtIndexPath:(NSIndexPath *)indexPath;
- (void)starSelectedProducts;

- (void)selectAllProductWithStatus:(BOOL)isSelected;
- (void)settleSelectedProducts;

@end
