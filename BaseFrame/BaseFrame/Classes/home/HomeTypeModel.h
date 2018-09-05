//
//  HomeTypeModel.h
//  BaseFrame
//
//  Created by 邱 德政 on 17/5/8.
//  Copyright © 2017年 济南联祥技术有限公司. All rights reserved.
//  分类

#import "BaseModel.h"

@interface HomeTypeModel : BaseModel
@property (nonatomic,strong)NSString* Id;
@property (nonatomic,strong)NSString* isleaf;
@property (nonatomic,strong)NSString* ismenu;
@property (nonatomic,strong)NSString* isvalid;
@property (nonatomic,strong)NSString* folder;
@property (nonatomic,strong)NSString* name;
@property (nonatomic,strong)NSString* parentid;
@property (nonatomic,strong)NSString* autoname;
@property (nonatomic,strong)NSString* picname;
@property (nonatomic,strong)NSString* catetype;
@property (nonatomic,strong)NSString* unionkey;
@property (nonatomic,strong)NSString* vorder;
@property (nonatomic,strong)NSString* note;
@property (nonatomic,strong)NSString* profix;
@property (nonatomic,strong)NSString* typenote;
/*
 autoname = "6953f7c660bc413a9d6a200f65352b90.png";
 catetype = protype;
 folder = "productimages/";
 id = 536;
 isleaf = 1;
 ismenu = 0;
 isvalid = 1;
 name = "\U7c89\U9488";
 note = "";
 parentid = 433;
 picname = "\U5fae\U4fe1\U56fe\U7247_20171202162609.png";
 profix = "";
 typenote = "";
 unionkey = 536;
 vorder = 15801;
 */
@end
