//
//  UserLoginVC.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/11.
//

#import "UserLoginVC.h"
#import <YYKit/YYKit.h>
#import <Masonry/Masonry.h>
#import <BlocksKit/BlocksKit.h>
#import <BlocksKit/UIControl+BlocksKit.h>
#import <BmobSDK/Bmob.h>
#import "UserInfosVC.h"
#import "UserLoginAndRegisterVC.h"

@interface UserLoginVC () <UserLoginAndRegisterVCDelegate>

@property (nonatomic, assign)BOOL login;
@property (nonatomic, strong)UIImageView *back;
@property (nonatomic, strong)UITextField *usernameTF;
@property (nonatomic, strong)UITextField *passwdTF;
@property (nonatomic, strong)UILabel *login1;
@property (nonatomic, strong)UIButton *regis;
@property (nonatomic, strong)UIButton *loginBtn;

@end

@implementation UserLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.userInteractionEnabled = YES;
    [self usernameTF];
    [self passwdTF];
    [self back];
    [self login1];
    [self regis];
    [self loginBtn];
    [self setGesture];
}

- (void)setGesture {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backTo)];
    [self.back addGestureRecognizer:tap];
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jumpRegi)];
    [self.regis addGestureRecognizer:tap1];
}

- (void)backTo {
    [self.delegate backToVC];
}

- (void)jumpRegi {
    UserLoginAndRegisterVC *vc = [[UserLoginAndRegisterVC alloc] init];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:nil];
}

- (void)backToVC {
    [self.navigationController popViewControllerAnimated:nil];
}

#pragma mark - 懒加载

- (UIImageView *)back {
    if (!_back) {
        _back = [[UIImageView alloc] initWithFrame:CGRectZero];
        _back.backgroundColor = [UIColor clearColor];
        _back.contentMode = UIViewContentModeScaleAspectFit;
        _back.userInteractionEnabled = YES;
        _back.image = [UIImage imageNamed:@"ic_back"];
        [self.view addSubview:_back];
        [_back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(20);
            make.left.mas_equalTo(0);
            make.height.mas_equalTo(45);
            make.width.mas_offset(45);
        }];
    }
    return _back;
}

- (UILabel *)login1 {
    if (!_login1) {
        _login1 = [[UILabel alloc] initWithFrame:CGRectZero];
        _login1.backgroundColor = [UIColor clearColor];
        _login1.font = [UIFont systemFontOfSize:18 weight:UIFontWeightMedium];
        _login1.textColor = [UIColor blackColor];
        _login1.text = @"登陆";
        [self.view addSubview:_login1];
        [_login1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(20);
            make.centerX.equalTo(self.view);
            make.height.mas_equalTo(45);
        }];
    }
    return _login1;
}

- (UIButton *)regis {
    if (!_regis) {
        _regis = [UIButton buttonWithType:UIButtonTypeCustom];
        [_regis.layer setMasksToBounds:YES];
        [_regis.layer setCornerRadius:10];
        [_regis setTitle:@"注册" forState:UIControlStateNormal];
        [_regis setBackgroundColor:[UIColor grayColor]];
        [self.view addSubview:_regis];
        [_regis mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(20);
            make.width.mas_equalTo(50);
            make.right.equalTo(self.view);
            make.height.mas_equalTo(45);
        }];
    }
    return _regis;
}


- (UITextField *)usernameTF {
    if(_usernameTF == nil) {
        _usernameTF = [[UITextField alloc] init];
        _usernameTF.borderStyle = UITextBorderStyleRoundedRect;
        _usernameTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _usernameTF.backgroundColor = [UIColor whiteColor];
        _usernameTF.placeholder = @"    请输入您的用户名";
        [self.view addSubview:_usernameTF];
        [_usernameTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.back.mas_bottom).mas_equalTo(2);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(45);
        }];
    }
    return _usernameTF;
}

- (UITextField *)passwdTF {
    if(_passwdTF == nil) {
        _passwdTF = [[UITextField alloc] init];
        _passwdTF.borderStyle = UITextBorderStyleRoundedRect;
        _passwdTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwdTF.secureTextEntry = YES;
        _passwdTF.placeholder = @"    请输入您的密码";
        _passwdTF.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_passwdTF];
        [_passwdTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.usernameTF.mas_bottom).mas_equalTo(2);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(45);
        }];
    }
    return _passwdTF;
}

- (UIButton *)loginBtn {
    if(_loginBtn == nil) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn.layer setMasksToBounds:YES];
        [_loginBtn.layer setCornerRadius:5];
        [_loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
        [_loginBtn setBackgroundColor:[UIColor grayColor]];
        [self.view addSubview:_loginBtn];
        [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.passwdTF.mas_bottom).mas_equalTo(20);
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-20);
        }];
        [_loginBtn bk_addEventHandler:^(id sender) {
            // 使用 Bmob后端云的 登陆服务
            [BmobUser loginWithUsernameInBackground:self.usernameTF.text password:self.passwdTF.text block:^(BmobUser *user, NSError *error) {
                if (user) {
                    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES)lastObject];
                    // 拼接文件路径
                    NSString *path = [doc stringByAppendingPathComponent:@"user.plist"];
                    NSDictionary *dic = [NSDictionary dictionaryWithObject:self.usernameTF.text forKey:@"username"];
                    [dic writeToFile:path atomically:YES];
                    [self.delegate updateModel:self.usernameTF.text];
                }else {
                    if ([self.usernameTF.text isEqualToString:@""] && [self.passwdTF.text isEqualToString:@""]) {
                        [self showSuccessWithMsg:@"请输入用户名和密码"];
                    }else if ([self.passwdTF.text isEqualToString:@""]) {
                        [self showSuccessWithMsg:@"请输入密码"];
                    }else if ([self.usernameTF.text isEqualToString:@""]) {
                        [self showSuccessWithMsg:@"请输入用户名"];
                    }else {
                        [self showSuccessWithMsg:@"用户名或密码错误，可注册新账号后登陆"];
                    }
                }
            }];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

@end
