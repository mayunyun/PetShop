//
//  MYYRegisterSubmitViewController.m
//  BaseFrame
//
//  Created by apple on 17/5/5.
//  Copyright © 2017年 济南联祥技术有限公司. All rights reserved.
//

#import "MYYRegisterSubmitViewController.h"
#import "RegistReferModel.h"
#import "ProvinceModel.h"

@interface MYYRegisterSubmitViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UITextField * _accountname;
    UITextField * _custname;
    UITextField* _pwdField;
   // UITextField* _againPwdField;
    UITextField* _phoneField;
    NSMutableArray* _downBtnArray;
    UIView* _popView;
    UIButton* _hide_keHuPopViewBut;
    NSString* _provinceid;
    NSMutableArray* _provinceDataArray;
    NSString* _cityid;
    NSMutableArray* _cityDataArray;
    NSString* _countryid;
    NSMutableArray* _countryDataArray;
    //NSString* _xiaoquid;
    //NSMutableArray* _viliageDataArray;
    NSString* _chargerid;
    NSString* _chargername;
    NSMutableArray* _chargeDataArray;
    NSString* _recommenderid;
    NSString* _recommendername;
    NSString* _typeId;

    
}
@property (nonatomic,strong)UITableView* proTableView;
@end

@implementation MYYRegisterSubmitViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UIImage *image = [UIImage imageNamed:@"iconfont-touming"];
    [self.navigationController.navigationBar setBackgroundImage:image
                                                  forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:image];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _downBtnArray = [NSMutableArray arrayWithCapacity:5];
    _provinceDataArray = [[NSMutableArray alloc]init];
    _cityDataArray = [[NSMutableArray alloc]init];
    _countryDataArray = [[NSMutableArray alloc]init];
    //_viliageDataArray = [[NSMutableArray alloc]init];
    _chargeDataArray = [[NSMutableArray alloc]init];
    self.title = @"注册";
    
    [self creatUI];
}

- (void)creatUI
{
    // 1.设置背景色
    UIImageView *bgimage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, mScreenWidth, mScreenHeight)];
    bgimage.image = [UIImage imageNamed:@"loginBG"];
    bgimage.userInteractionEnabled = YES;
    [self.view addSubview:bgimage];
    
    // 2.添加子视图
    UIScrollView* bgSView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    bgSView.contentSize = CGSizeMake(kScreen_Width, 714);
    bgSView.showsVerticalScrollIndicator = NO;
    bgSView.showsHorizontalScrollIndicator = NO;
    [bgimage addSubview:bgSView];
    
    UIView *bgview = [[UIView alloc]initWithFrame:CGRectMake(20, 10, mScreenWidth-40, 300)];
    bgview.backgroundColor = [UIColor colorWithWhite:1.f alpha:0.8];
    bgview.layer.cornerRadius=7;
    [bgSView addSubview:bgview];
    //用户名
    UIImageView *accountnameImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10+17*MYWIDTH, 15, 18)];
    accountnameImage.image = [UIImage imageNamed:@"02020"];
    [bgview addSubview:accountnameImage];
    
    _accountname = [[UITextField alloc]initWithFrame:CGRectMake(50, 10, bgview.width - 70, 54)];
    _accountname.delegate = self;
//    _accountname.secureTextEntry = YES;
    _accountname.placeholder = @"请输入用户名";
    _accountname.font = [UIFont systemFontOfSize:14];
    _accountname.keyboardType = UIKeyboardTypeDefault;//数字英文键盘
    _accountname.enablesReturnKeyAutomatically = YES; //这里设置为无文字就灰色不可点
    [bgview addSubview:_accountname];
    UIView* accountnameLine = [[UIView alloc]initWithFrame:CGRectMake(20, _accountname.bottom, bgview.width-40, 1)];
    accountnameLine.backgroundColor = LineColor;
    [bgview addSubview:accountnameLine];

    //登录密码
    UIImageView *titleimage1 = [[UIImageView alloc]initWithFrame:CGRectMake(20, accountnameLine.bottom+17*MYWIDTH, 15, 18)];
    titleimage1.image = [UIImage imageNamed:@"02020"];
    [bgview addSubview:titleimage1];
    
    _pwdField = [[UITextField alloc]initWithFrame:CGRectMake(50, accountnameLine.bottom, bgview.width - 70, 54)];
    _pwdField.delegate = self;
    _pwdField.secureTextEntry = YES;
    _pwdField.placeholder = @"请输入登录密码";
    _pwdField.font = [UIFont systemFontOfSize:14];
    _pwdField.keyboardType = UIKeyboardTypeASCIICapable;//数字英文键盘
    _pwdField.enablesReturnKeyAutomatically = YES; //这里设置为无文字就灰色不可点
    [bgview addSubview:_pwdField];
    UIView* line1 = [[UIView alloc]initWithFrame:CGRectMake(20, _pwdField.bottom, bgview.width-40, 1)];
    line1.backgroundColor = LineColor;
    [bgview addSubview:line1];

    NSArray* placeholderArray  = @[@"请选择客户类型",@"请选择专属业务负责人"];
    NSArray* leftLabelArray= @[@"类型(必选)",@"负责人(可选)"];
    UIView* line;
    for (int i = 0; i < leftLabelArray.count; i++) {
        UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(20, line1.bottom+i*55, 100*MYWIDTH, _pwdField.height)];
        label.text = leftLabelArray[i];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = UIColorFromRGB(0x666666);
        [bgview addSubview:label];
        UIButton* btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:placeholderArray[i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setTitleColor:GrayTitleColor forState:UIControlStateNormal];
        btn.frame = CGRectMake(label.right+8, label.top, bgview.width - 30 - label.width, _pwdField.height);
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [btn addTarget:self action:@selector(downBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [bgview addSubview:btn];
        [_downBtnArray addObject:btn];
//        if (i<leftLabelArray.count) {
        line = [[UIView alloc]initWithFrame:CGRectMake(line1.left, _pwdField.bottom+55*i+54, line1.width, 1)];
        line.backgroundColor = LineColor;
        [bgview addSubview:line];
//        }
        UIImageView* imageView = [[UIImageView alloc]initWithFrame:CGRectMake(bgview.right - 60, _pwdField.bottom+(_pwdField.height - 5)*0.5+55*i, 10, 5)];
        imageView.image = [UIImage imageNamed:@"downBtn"];
        [bgview addSubview:imageView];
    }
    UILabel * introduceLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, line.bottom+2, bgview.width-40, 60)];
    introduceLabel.text = @"温馨提示:办事处购买单位为最大单位(件/箱)。代理购买单位为中间单位(盒/瓶)。消费者购买单位可以任意选择。";
    introduceLabel.textColor = [UIColor redColor];
    introduceLabel.font = [UIFont systemFontOfSize:14];
    introduceLabel.numberOfLines= 3;
    [bgview addSubview:introduceLabel];
    
    UIButton* registBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    registBtn.frame = CGRectMake(20,bgview.bottom+45 , mScreenWidth-40, 45);
    registBtn.backgroundColor = NavBarItemColor;
    [registBtn setTitle:@"提交注册" forState:UIControlStateNormal];
    [registBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    registBtn.layer.masksToBounds = YES;
    registBtn.layer.cornerRadius = 5;
    [bgSView addSubview:registBtn];
    [registBtn addTarget:self action:@selector(registBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)downBtnClick:(UIButton*)sender{
    [_chargeDataArray removeAllObjects];
        if (sender == _downBtnArray[1]){
        [self popViewUI:1];
        [_chargeDataArray removeAllObjects];
        _chargerid = @"";
        for (int i = 1 ; i < _downBtnArray.count-1 ;i++) {
            UIButton* btn = _downBtnArray[i];
            [btn setTitle:@" " forState:UIControlStateNormal];
        }
        [self personInChargeRequest];
    }
    else if (sender == _downBtnArray[0]){
        [self popViewUI:0];
        _typeId = @"";
        for (int i = 0 ; i < _downBtnArray.count-2 ;i++) {
            UIButton* btn = _downBtnArray[i];
            [btn setTitle:@" " forState:UIControlStateNormal];
        }
        [self.proTableView reloadData];
    }
}

- (void)registBtnClick:(UIButton*)sender{
    //self.phone,self.phone,self.phone,self.phone,_pwdField.text必填
    
        //if ([_pwdField.text isEqualToString:_againPwdField.text]) {
        if (IsEmptyValue(_accountname.text)) {
            [self customAlert:@"请填写用户名"];
            return;
        }
        if (IsEmptyValue(_pwdField.text)){
            [self customAlert:@"请填写密码"];
            return;
        }
        if (IsEmptyValue(_typeId)) {
            [self customAlert:@"请选择客户类型"];
            return;
        }
        [self registDataForLoveDogRequest];
}

- (void)popViewUI:(NSInteger)tag{
    _popView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,kScreen_Width, kScreen_Height)];
    //        self.m_keHuPopView.backgroundColor = [UIColor grayColor];
    _popView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    //
    _hide_keHuPopViewBut = [UIButton buttonWithType:UIButtonTypeSystem];
    _hide_keHuPopViewBut.backgroundColor = [UIColor clearColor];
    _hide_keHuPopViewBut.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height);
    [_hide_keHuPopViewBut addTarget:self action:@selector(closePop) forControlEvents:UIControlEventTouchUpInside];
    [_popView addSubview:_hide_keHuPopViewBut];
    
    if (self.proTableView == nil) {
        self.proTableView = [[UITableView alloc]initWithFrame:CGRectMake(10, 80,kScreen_Width-20, kScreen_Height-174) style:UITableViewStylePlain];
        self.proTableView.backgroundColor = [UIColor whiteColor];
    }
    self.proTableView.dataSource = self;
    self.proTableView.delegate = self;
    self.proTableView.tag = 100+tag;
    self.proTableView.rowHeight = 80;
    [_popView addSubview:self.proTableView];
    //        [self.view addSubview:self.m_keHuPopView];
    [[UIApplication sharedApplication].keyWindow addSubview:_popView];

}


- (void)closePop{
    [_popView removeFromSuperview];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (tableView.tag) {
        case 100:{
            return 3;
        }break;
        case 101:{
            return _chargeDataArray.count;
        }break;
        default:return 0;
            break;
    }
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellID = @"cellID";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
    }
    switch (tableView.tag) {
        
        case 101:{
            if (!IsEmptyValue(_chargeDataArray)) {
                ChargeModel* model = _chargeDataArray[indexPath.row];
                cell.textLabel.text = [NSString stringWithFormat:@"%@",model.accountname];
            }else{
                cell.textLabel.text = @"";
            }
        }break;
        case 100:{
            NSArray *arr = @[@"办事处",@"代理",@"消费者"];
            cell.textLabel.text = [NSString stringWithFormat:@"%@",arr[indexPath.row]];
        }break;
        default:break;
    }
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (tableView.tag) {
        
        case 101:{
            if (!IsEmptyValue(_chargeDataArray)) {
                ChargeModel* model = _chargeDataArray[indexPath.row];
                _chargerid = [NSString stringWithFormat:@"%@",model.accountid];
                _chargername = [NSString stringWithFormat:@"%@",model.accountname];
                UIButton* btn = _downBtnArray[tableView.tag-100];
                [btn setTitle:[NSString stringWithFormat:@"%@",model.accountname] forState:UIControlStateNormal];
                [_popView removeFromSuperview];
            }
        }break;
        case 100:{
            NSArray *arr = @[@"办事处",@"代理",@"消费者"];
            _typeId = [NSString stringWithFormat:@"%zd",indexPath.row];
            UIButton* btn = _downBtnArray[tableView.tag-100];
            [btn setTitle:[NSString stringWithFormat:@"%@",arr[indexPath.row]] forState:UIControlStateNormal];
            [_popView removeFromSuperview];
            
        }break;
        default:break;
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == _pwdField) {
        if (![Command isPassword:_pwdField.text]) {
            [Command customAlert:@"密码长度6-20位"];
        }

    }
}

- (void)personInChargeRequest{
    NSDictionary* params = @{@"params":[NSString stringWithFormat:@"{\"xiaoquid\":\"%@\"}",@""]};
    [HTNetWorking postWithUrl:@"register?action=loadChargeid" refreshCache:YES params:params success:^(id response) {
        NSString* str = [[NSString alloc]initWithData:response encoding:NSUTF8StringEncoding];
        NSLog(@"负责人数据%@",str);
        NSArray* array = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:nil];
        if (!IsEmptyValue(array)) {
            [_chargeDataArray removeAllObjects];
            for (NSDictionary* dict in array) {
                ChargeModel* model = [[ChargeModel alloc]init];
                [model setValuesForKeysWithDictionary:dict];
                [_chargeDataArray addObject:model];
            }
        }
        [self.proTableView reloadData];

    } fail:^(NSError *error) {
        
    }];
}
- (BOOL)isPureInt:(NSString *)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}
-(void)registDataForLoveDogRequest{
    _chargerid = [Command convertNull:_chargerid];
    if (![_chargerid isEqualToString:@""]) {
        NSDictionary* params = @{@"data":[NSString stringWithFormat:@"{\"chargeid\":\"%@\"}",_chargerid]};
        NSLog(@"%@",params);
        [HTNetWorking postWithUrl:@"register?action=loadChargeid" refreshCache:YES showHUD:@"" params:params success:^(id response) {
            //            NSString* str = [[NSString alloc]initWithData:response encoding:NSUTF8StringEncoding];
            NSArray* array = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:nil];
            if (!IsEmptyValue(array)) {
                NSLog(@"%@",array);
                NSDictionary* params = @{@"data":[NSString stringWithFormat:@"{\"name\":\"%@\",\"password\":\"%@\",\"custtypeid\":\"%@\",\"accountname\":\"%@\",\"accountid\":\"%@\",\"phone\":\"%@\"}",_accountname.text,_pwdField.text,_typeId,_chargername,_chargerid,self.phone]};
                NSString * stringUrl = [NSString stringWithFormat:@"%@register?action=addCustomer",PAY_INTERFACE];
                //http://118.190.47.231/jx
                [HTNetWorking postWithUrl:stringUrl refreshCache:YES params:params success:^(id response) {
                    NSString* str = [[NSString alloc]initWithData:response encoding:NSUTF8StringEncoding];
                    if ([str containsString:@"true"]) {
                        
                        [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%@",_accountname.text] forKey:USERPHONE];
                        [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%@",_pwdField.text] forKey:PASSWORD];
                        
                        NSArray* array = self.navigationController.viewControllers;
                        UIViewController *viewCtl = self.navigationController.viewControllers[array.count - 1 - 2];
                        [self.navigationController popToViewController:viewCtl animated:YES];
                    }else{
                       
                        [self customAlert:str];
                    }

                } fail:^(NSError *error) {
                    
                }];
            }
        } fail:^(NSError *error) {
            
        }];
    }else{
         NSDictionary* params = @{@"data":[NSString stringWithFormat:@"{\"name\":\"%@\",\"password\":\"%@\",\"custtypeid\":\"%@\",\"accountname\":\"%@\",\"accountid\":\"%@\",\"phone\":\"%@\"}",_accountname.text,_pwdField.text,_typeId,@"",@"",self.phone]};
        NSString * stringUrl = [NSString stringWithFormat:@"%@register?action=addCustomer",PAY_INTERFACE];
        [HTNetWorking postWithUrl:stringUrl refreshCache:YES params:params success:^(id response) {
            NSString* str = [[NSString alloc]initWithData:response encoding:NSUTF8StringEncoding];
            if ([str containsString:@"true"]) {
                [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%@",_accountname.text] forKey:USERPHONE];
                [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%@",_pwdField.text] forKey:PASSWORD];
                
                NSArray* array = self.navigationController.viewControllers;
                UIViewController *viewCtl = self.navigationController.viewControllers[array.count - 1 - 2];
                [self.navigationController popToViewController:viewCtl animated:YES];
            }else{
                [self customAlert:str];
            }
        } fail:^(NSError *error) {
            
        }];
    }
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    return [textField resignFirstResponder];
}
@end
