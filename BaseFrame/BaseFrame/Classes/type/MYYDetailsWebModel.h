//
//  MYYDetailsWebModel.h
//  BaseFrame
//
//  Created by 邱 德政 on 17/5/10.
//  Copyright © 2017年 济南联祥技术有限公司. All rights reserved.
//

#import "BaseModel.h"

@interface MYYDetailsWebModel : BaseModel
@property (nonatomic,strong)NSString* id;
@property (nonatomic,strong)NSString* prono;
@property (nonatomic,strong)NSString* protypename;
@property (nonatomic,strong)NSString* note;
@property (nonatomic,strong)NSString* proid;
@property (nonatomic,strong)NSString* jxproid;
@property (nonatomic,strong)NSString* proname;
@property (nonatomic,strong)NSString* effectname;
@property (nonatomic,strong)NSString* specification;
@property (nonatomic,strong)NSString* proprice;
@property (nonatomic,strong)NSString* mainunitname;
@property (nonatomic,strong)NSString* evaluate;//评价总数量
@property (nonatomic,strong)NSString* mainunit;

/*
 {
 evaluate = 0;
 mainunit = 206;
 mainunitname = "\U4ef6";
 note = "";
 proid = 444;
 proname = "\U9ec4\U6c0f\U591a\U7cd6";
 prono = 8889;
 proprice = 200;
 protypename = "\U6d88\U6bd2\U5242";
 specification = "\U4e00\U4ef62\U7bb15\U76d2";
 */
@end
