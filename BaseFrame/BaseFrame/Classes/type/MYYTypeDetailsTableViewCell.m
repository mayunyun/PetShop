//
//  MYYTypeDetailsTableViewCell.m
//  BaseFrame
//
//  Created by apple on 17/5/3.
//  Copyright © 2017年 济南联祥技术有限公司. All rights reserved.
//

#import "MYYTypeDetailsTableViewCell.h"

@implementation MYYTypeDetailsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    self.imgView.layer.cornerRadius = 5;
    self.imgView.clipsToBounds = YES;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.titleLabel.text = [NSString stringWithFormat:@"%@",_model.proname];
    self.gugeLabel.text = [NSString stringWithFormat:@"%@",_model.specification];
//    NSString * pric = [NSString stringWithFormat:@"%.2f",[_model.minsaleprice floatValue]/[_model.sectoremain floatValue]];
    if (!IsEmptyValue(_model.saleprice)) {
        [self setstockcount:_model.Id price:_model.saleprice secondunitname:_model.remainderunitname maintosecond:_model.maintosec];
    }else{
        self.priceLabel.text = [NSString stringWithFormat:@"￥ 0/%@    库存:%@",_model.stockcount,_model.secondunitname];
    }
    NSString* baseurl = HTImgUrl;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@",baseurl,@"productimages",_model.autoname]] placeholderImage:[UIImage imageNamed:@"default_img_cell"]];
}
- (void)setstockcount:(NSString *)proid price:(NSString *)price secondunitname:(NSString *)secondunitname maintosecond:(NSString *)maintosecond{
    NSDictionary* params = @{@"data":[NSString stringWithFormat:@"{\"proid\":\"%@\"}",proid]};
    [HTNetWorking postWithUrl:[NSString stringWithFormat:@"%@mall/showproduct?action=searchstock",PAY_INTERFACE] refreshCache:YES params:params success:^(id response) {
        NSArray* array = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:nil];
        
        if (array.count) {
            NSString * sprice = [Command formatFloat:[price floatValue]/[maintosecond floatValue]/[_model.sectoremain floatValue]];
            
            self.priceLabel.text = [NSString stringWithFormat:@"￥%@/%@     库存:%@",sprice,secondunitname,[Command formatFloat:[[array[0] objectForKey:@"stockcount"] floatValue]/[maintosecond floatValue]]];
            [self changeTextFont:self.priceLabel Txt:self.priceLabel.text changeTxt:[NSString stringWithFormat:@"库存:%@",[Command formatFloat:[[array[0] objectForKey:@"stockcount"] floatValue]/[maintosecond floatValue]]]];
        }
    } fail:^(NSError *error) {
        
    }];
}
//改变某字符串的大小
- (void)changeTextFont:(UILabel *)label Txt:(NSString *)text changeTxt:(NSString *)change
{
    NSString *str= change;
    if ([text rangeOfString:str].location != NSNotFound)
    {
        //关键字在字符串中的位置
        NSUInteger location = [text rangeOfString:str].location;
        //长度
        NSUInteger length = [text rangeOfString:str].length;
        //改变大小之前的转换
        NSMutableAttributedString *str1 = [[NSMutableAttributedString alloc]initWithString:text];
        //改变大小
        [str1 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(location, length)];
        //赋值
        label.attributedText = str1;
    }
}
- (IBAction)shopCarBtnClick:(id)sender {
    if (_transVaule) {
        _transVaule(_model);
    }
}
@end