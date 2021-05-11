//
//  UserLoginAndRegisterVC.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/11.
//

#import "UserLoginAndRegisterVC.h"
#import <YYKit/YYKit.h>
#import <Masonry/Masonry.h>
#import <BlocksKit/BlocksKit.h>
#import <BlocksKit/UIControl+BlocksKit.h>
#import <BmobSDK/Bmob.h>
#import "UserInfosVC.h"

@interface UserLoginAndRegisterVC ()

@property (nonatomic, assign)BOOL login;
@property (nonatomic, strong)UIImageView *back;
@property (nonatomic, strong)UITextField *usernameTF;
@property (nonatomic, strong)UITextField *passwdTF;
@property (nonatomic, strong)UITextField *introTF;
@property (nonatomic, strong)UITextField *nickNameTF;
@property (nonatomic, strong)UIButton *registerBtn;
@property (nonatomic, strong)UIButton *loginBtn;

@end

@implementation UserLoginAndRegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    self.view.backgroundColor = [UIColor whiteColor];
    [self back];
    [self usernameTF];
    [self passwdTF];
    [self introTF];
    [self nickNameTF];
    [self registerBtn];
    [self setGesture];
}

- (void)setGesture {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backTo)];
    [self.back addGestureRecognizer:tap];
}

- (void)backTo {
    [self.delegate backToVC];
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

- (UITextField *)introTF {
    if(_introTF == nil) {
        _introTF = [[UITextField alloc] init];
        _introTF.borderStyle = UITextBorderStyleRoundedRect;
        _introTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _introTF.placeholder = @"    请输入您的简介";
        _introTF.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_introTF];
        [_introTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.passwdTF.mas_bottom).mas_equalTo(2);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(45);
        }];
    }
    return _introTF;
}

- (UITextField *)nickNameTF {
    if(_nickNameTF == nil) {
        _nickNameTF = [[UITextField alloc] init];
        _nickNameTF.borderStyle = UITextBorderStyleRoundedRect;
        _nickNameTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _nickNameTF.placeholder = @"    请输入您的昵称";
        _nickNameTF.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_nickNameTF];
        [_nickNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.introTF.mas_bottom).mas_equalTo(2);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(45);
        }];
    }
    return _nickNameTF;
}

- (UIButton *)registerBtn {
    if(_registerBtn == nil) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerBtn.layer setMasksToBounds:YES];
        [_registerBtn.layer setCornerRadius:5];
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_registerBtn setBackgroundColor:[UIColor grayColor]];
        [self.view addSubview:_registerBtn];
        [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.nickNameTF.mas_bottom).mas_equalTo(20);
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-20);
        }];
        [_registerBtn bk_addEventHandler:^(id sender) {
            // 使用 Bmob后端云的 注册服务
            BmobObject *user = [BmobObject objectWithClassName:@"_User"];
            [user setObject:self.usernameTF.text forKey:@"username"];
            [user setObject:self.passwdTF.text forKey:@"password"];
            [user setObject:self.nickNameTF.text forKey:@"U_NickName"];
            [user setObject:self.introTF.text forKey:@"userIntro"];
            if ([self.usernameTF.text isEqualToString:@""] && [self.passwdTF.text isEqualToString:@""]) {
                [self showSuccessWithMsg:@"请输入用户名和密码"];
            }else if ([self.passwdTF.text isEqualToString:@""]) {
                [self showSuccessWithMsg:@"请输入密码"];
            }else if ([self.usernameTF.text isEqualToString:@""]) {
                [self showSuccessWithMsg:@"请输入用户名"];
            }else if ([self.introTF.text isEqualToString:@""]) {
                [self showSuccessWithMsg:@"请输入简介"];
            }else if ([self.nickNameTF.text isEqualToString:@""]) {
                [self showSuccessWithMsg:@"请输入昵称"];
            }else {
                [user saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
                    //进行操作
                    if (isSuccessful) {
                        UserInfosVC *vc = [UserInfosVC new];
                        [self.navigationController pushViewController:vc animated:YES];
                    }else {
                        [self showSuccessWithMsg:@"用户名已存在"];
                    }
                }];
            }
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerBtn;
}


@end
