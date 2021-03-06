//
//  HomeLineCollectionView.h
//  BaseFrame
//
//  Created by 邱 德政 on 17/5/3.
//  Copyright © 2017年 济南联祥技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeFavorableModel.h"

@interface HomeLineCollectionView : UICollectionView<UICollectionViewDataSource>

@property (nonatomic,strong)NSArray* dataArr;
@property (nonatomic, copy) void (^transVaule)(HomeFavorableModel* model);

@end
