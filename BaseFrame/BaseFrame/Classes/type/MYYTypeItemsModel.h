//
//  MYYTypeItemsModel.h
//  BaseFrame
//
//  Created by apple on 17/5/8.
//  Copyright © 2017年 济南联祥技术有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 autoname = "cce558e20e904171be91ca4f7ae9d91e.png";
 factoryprice = 100;
 id = 440;
 isvalid = 1;
 life = 10;
 maintosec = 10;
 mainunit = 206;
 mainunitname = "\U4ef6";
 minsaleprice = 10;
 note = "";
 proname = "\U76d0\U9178\U5ba0\U53ef\U5eb7";
 prono = 0403;
 protypeid = 536;
 protypename = "\U7c89\U9488";
 remainderunitid = 178;
 remainderunitname = "\U76d2";
 saleprice = 100;
 secondunit = 217;
 secondunitname = "\U7bb1";
 sectoremain = 10;
 specification = "\U4e00\U4ef610\U7bb110\U76d2";
 totalcount = 0;
 type = 3;

*/
@interface MYYTypeItemsModel : NSObject
@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *saleprice;
@property(nonatomic,copy)NSString *remainderunitid;
@property(nonatomic,copy)NSString *remainderunitname;
@property(nonatomic,copy)NSString *prono;
@property(nonatomic,copy)NSString *stockcount;
@property(nonatomic,copy)NSString *proname;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *jxproid;
@property(nonatomic,copy)NSString *protypename;
@property(nonatomic,copy)NSString *autoname;
@property(nonatomic,copy)NSString *protypeid;
@property(nonatomic,copy)NSString *specification;
@property(nonatomic,copy)NSString *maintosec;
@property(nonatomic,copy)NSString *sectoremain;

@property(nonatomic,copy)NSString *minsaleprice;
@property(nonatomic,copy)NSString *secondunitname;
@end
