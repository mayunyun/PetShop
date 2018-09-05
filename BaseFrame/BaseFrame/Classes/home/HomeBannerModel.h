//
//  HomeBannerModel.h
//  BaseFrame
//
//  Created by 邱 德政 on 17/5/8.
//  Copyright © 2017年 济南联祥技术有限公司. All rights reserved.
//

#import "BaseModel.h"

@interface HomeBannerModel : BaseModel
@property (nonatomic,strong)NSString* folder;           //文件夹
@property (nonatomic,strong)NSString* status;
@property (nonatomic,strong)NSString* note;             //备注
@property (nonatomic,strong)NSString* Id;
@property (nonatomic,strong)NSString* uuid;
@property (nonatomic,strong)NSString* picname;          //图片名
@property (nonatomic,strong)NSString* autoname;
@property (nonatomic,strong)NSString* subjectname;
@property (nonatomic,strong)NSString* phoneautoname;
/*
 folder = "productSpecialImg/";
 status = "special";
 note = "<p>回复看见了很多事可发货是的冯绍峰就</p>";
 id = 4;
 uuid = "6d7e0508-f3eb-48b2-a3c3-e7f4bf87f2e0";
 picname = "phone.jpg";
 specialname = "专题一";
 autoname = "aaffb7c4a0f14802a0ab5b8a10280049.jpg"
 */

@end
