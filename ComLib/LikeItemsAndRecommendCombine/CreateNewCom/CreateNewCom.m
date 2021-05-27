//
//  CreateNewCom.m
//  ComLib
//
//  Created by cuixianglong on 2021/4/21.
//

#import "CreateNewCom.h"
#import <YYKit/YYKit.h>
#import <Masonry/Masonry.h>
#import <BlocksKit/BlocksKit.h>
#import <BlocksKit/UIControl+BlocksKit.h>
#import <BmobSDK/Bmob.h>
#import "UserInfosVC.h"
#import "NSObjectGetStatus.h"
#import "ComDatasour.h"

@interface CreateNewCom ()

@property (nonatomic, assign)BOOL login;
@property (nonatomic, strong)UIImageView *back;
@property (nonatomic, strong)UITextField *pronameTF;
@property (nonatomic, strong)UITextField *CodeTypeTF;
@property (nonatomic, strong)UITextField *UseTypeTF;
@property (nonatomic, strong)UITextField *RunTypeTF;
@property (nonatomic, strong)UITextField *UseTF;
@property (nonatomic, strong)UITextField *IntroTF;
@property (nonatomic, strong)UITextField *LauTF;
@property (nonatomic, strong)UITextField *VersionTF;

@property (nonatomic, strong)UITextField *DetailTF;
@property (nonatomic, strong)UIButton *registerBtn;
@property (nonatomic, copy)NSString *name;

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) ComDatasour *dataSources;


@end

@implementation CreateNewCom

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    /*
    [self.view addSubview:self.headerView];
    CGFloat statusBarH = [NSObjectGetStatus statusBarH];
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.left.equalTo(self.view);
        make.top.offset(statusBarH);
        make.height.equalTo(@40);
    }];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_bottom);
        make.bottom.left.right.equalTo(self.view);
    }];
    */
    CGFloat statusBarH = [NSObjectGetStatus statusBarH];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.top.equalTo(self.view);
        make.top.equalTo(@(statusBarH));
    }];
    /*[self back];
    [self pronameTF];
    [self CodeTypeTF];
    [self UseTypeTF];
    [self RunTypeTF];
    [self UseTF];
    [self DetailTF];
    [self registerBtn];*/
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tapGr.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGr];
}

- (BOOL)disablesAutomaticKeyboardDismissal {
    return NO;
}

-(void)viewTapped:(UITapGestureRecognizer*)tapGr{
    [self.view resignFirstResponder];
}

#pragma mark - 懒加载

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 4.0;
        flowLayout.minimumInteritemSpacing = 4.0;
        //ui
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.contentInset = UIEdgeInsetsZero;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.backgroundView.backgroundColor = [UIColor clearColor];
        _collectionView.showsVerticalScrollIndicator = NO;
        //delegate
        _dataSources = [[ComDatasour alloc] init];
        _dataSources.collection = _collectionView;
        [_dataSources registCollectionViewCells:_collectionView];
        _dataSources.delegate = self;
        _collectionView.delegate = _dataSources;
        _collectionView.dataSource = _dataSources;
    }
    return _collectionView;
}


- (NSString *)name {
    if  (!_name) {
        NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES) lastObject];
        NSString *path = [doc stringByAppendingPathComponent:@"user.plist"];
        // 读取数据
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
        _name = [dict objectForKey:@"username"];
    }
    return _name;
}

- (UITextField *)pronameTF {
    if(_pronameTF == nil) {
        _pronameTF = [[UITextField alloc] init];
        _pronameTF.borderStyle = UITextBorderStyleRoundedRect;
        _pronameTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _pronameTF.backgroundColor = [UIColor whiteColor];
        _pronameTF.placeholder = @"    请输入您的构件名称";
        [self.view addSubview:_pronameTF];
        [_pronameTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(20);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(45);
        }];
    }
    return _pronameTF;
}

- (UITextField *)IntroTF {
    if(_IntroTF == nil) {
        _IntroTF = [[UITextField alloc] init];
        _IntroTF.borderStyle = UITextBorderStyleRoundedRect;
        _IntroTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _IntroTF.placeholder = @"    请输入您的构件简介";
        _IntroTF.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_IntroTF];
        [_IntroTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.pronameTF.mas_bottom).mas_equalTo(2);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(45);
        }];
    }
    return _IntroTF;
}

- (UITextField *)CodeTypeTF {
    if(_CodeTypeTF == nil) {
        _CodeTypeTF = [[UITextField alloc] init];
        _CodeTypeTF.borderStyle = UITextBorderStyleRoundedRect;
        _CodeTypeTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _CodeTypeTF.placeholder = @"    请输入您的构件语言类型";
        _CodeTypeTF.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_CodeTypeTF];
        [_CodeTypeTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.IntroTF.mas_bottom).mas_equalTo(2);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(45);
        }];
    }
    return _CodeTypeTF;
}

- (UITextField *)UseTypeTF {
    if(_UseTypeTF == nil) {
        _UseTypeTF = [[UITextField alloc] init];
        _UseTypeTF.borderStyle = UITextBorderStyleRoundedRect;
        _UseTypeTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _UseTypeTF.placeholder = @"    请输入您的构件用法";
        _UseTypeTF.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_UseTypeTF];
        [_UseTypeTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.CodeTypeTF.mas_bottom).mas_equalTo(2);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(45);
        }];
    }
    return _UseTypeTF;
}

- (UITextField *)RunTypeTF {
    if(_RunTypeTF == nil) {
        _RunTypeTF = [[UITextField alloc] init];
        _RunTypeTF.borderStyle = UITextBorderStyleRoundedRect;
        _RunTypeTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _RunTypeTF.placeholder = @"    请输入您的构件运行环境";
        _RunTypeTF.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_RunTypeTF];
        [_RunTypeTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.UseTypeTF.mas_bottom).mas_equalTo(2);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(45);
        }];
    }
    return _RunTypeTF;
}

- (UITextField *)UseTF {
    if(_UseTF == nil) {
        _UseTF = [[UITextField alloc] init];
        _UseTF.borderStyle = UITextBorderStyleRoundedRect;
        _UseTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _UseTF.placeholder = @"    请输入您的构件功能简述";
        _UseTF.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_UseTF];
        [_UseTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.RunTypeTF.mas_bottom).mas_equalTo(2);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(45);
        }];
    }
    return _UseTF;
}

- (UITextField *)LauTF {
    if(_LauTF == nil) {
        _LauTF = [[UITextField alloc] init];
        _LauTF.borderStyle = UITextBorderStyleRoundedRect;
        _LauTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _LauTF.placeholder = @"    请输入您的构件语言类型";
        _LauTF.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_LauTF];
        [_LauTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.UseTF.mas_bottom).mas_equalTo(2);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(45);
        }];
    }
    return _LauTF;
}

- (UITextField *)VersionTF {
    if(_VersionTF == nil) {
        _VersionTF = [[UITextField alloc] init];
        _VersionTF.borderStyle = UITextBorderStyleRoundedRect;
        _VersionTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _VersionTF.placeholder = @"    请输入您的构件版本";
        _VersionTF.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_VersionTF];
        [_VersionTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.LauTF.mas_bottom).mas_equalTo(2);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(45);
        }];
    }
    return _VersionTF;
}


- (UITextField *)DetailTF {
    if(_DetailTF == nil) {
        _DetailTF = [[UITextField alloc] init];
        _DetailTF.borderStyle = UITextBorderStyleRoundedRect;
        _DetailTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _DetailTF.placeholder = @"    请输入您的构件详细内容";
        _DetailTF.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_DetailTF];
        [_DetailTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.VersionTF.mas_bottom).mas_equalTo(2);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(45);
        }];
    }
    return _DetailTF;
}


- (UIButton *)registerBtn {
    if(_registerBtn == nil) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerBtn.layer setMasksToBounds:YES];
        [_registerBtn.layer setCornerRadius:5];
        [_registerBtn setTitle:@"创建" forState:UIControlStateNormal];
        [_registerBtn setBackgroundColor:[UIColor grayColor]];
        [self.view addSubview:_registerBtn];
        [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.DetailTF.mas_bottom).mas_equalTo(20);
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-20);
        }];
        [_registerBtn bk_addEventHandler:^(id sender) {
            // 使用 Bmob后端云的 注册服务
            BmobObject *user = [BmobObject objectWithClassName:@"Component"];
            [user setObject:self.pronameTF.text forKey:@"C_ProName"];
            [user setObject:self.CodeTypeTF.text forKey:@"C_CodeType"];
            [user setObject:self.UseTypeTF.text forKey:@"C_UseType"];
            [user setObject:self.RunTypeTF.text forKey:@"C_RunType"];
            [user setObject:self.UseTF.text forKey:@"C_Use"];
            [user setObject:self.DetailTF.text forKey:@"C_Detail"];
            [user setObject:self.name forKey:@"C_OwnerID"];
            if ([self.pronameTF.text isEqualToString:@""]) {
                [self showSuccessWithMsg:@"请输入构件名称"];
            }else if ([self.CodeTypeTF.text isEqualToString:@""]) {
                [self showSuccessWithMsg:@"请输入构件类型"];
            }else if ([self.UseTF.text isEqualToString:@""]) {
                [self showSuccessWithMsg:@"请输入构件功能"];
            }else if ([self.UseTypeTF.text isEqualToString:@""]) {
                [self showSuccessWithMsg:@"请输入构件用法"];
            }else if ([self.RunTypeTF.text isEqualToString:@""]) {
                [self showSuccessWithMsg:@"请输入构件运行平台"];
            }else if ([self.DetailTF.text isEqualToString:@""]) {
                [self showSuccessWithMsg:@"请输入构件运行详细内容"];
            }else {
                [user saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
                    //进行操作
                    if (isSuccessful) {
                        //UserInfosVC *vc = [UserInfosVC new];
                        //[self.navigationController pushViewController:vc animated:YES];
                        [self showSuccessWithMsg:@"构件添加成功"];
                    }else {
                        [self showSuccessWithMsg:@"构件已存在"];
                    }
                }];
            }
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerBtn;
}

@end
