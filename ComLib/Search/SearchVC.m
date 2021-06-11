//
//  SearchVC.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/9.
//

#import "SearchVC.h"
#import "SearchOpenListTableView.h"
#import "NSObjectGetStatus.h"
#import <Masonry/Masonry.h>
#import "SearchBarView.h"
#import "SearchResultVC.h"

@interface SearchVC ()

@property (nonatomic, strong)SearchOpenListTableView *tableView;
@property (nonatomic, strong)SearchBarView *scrollView;

@property (nonatomic, strong)UITextField *pronameTF;
@property (nonatomic, strong)UITextField *CodeTypeTF;
@property (nonatomic, strong)UITextField *UseTypeTF;
@property (nonatomic, strong)UITextField *RunTypeTF;
@property (nonatomic, strong)UIButton *searchBtn;

@end

@implementation SearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.pronameTF];
    [self.view addSubview:self.CodeTypeTF];
    [self.view addSubview:self.UseTypeTF];
    [self.view addSubview:self.RunTypeTF];
    [self.view addSubview:self.searchBtn];
    [self setGes];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)setGes {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealSearch)];
    [self.searchBtn addGestureRecognizer:tap];
}

- (void)dealSearch {
    SearchResultVC *vc = [[SearchResultVC alloc] init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:self.pronameTF.text forKey:@"pronameTF"];
    [dict setValue:self.CodeTypeTF.text forKey:@"CodeTypeTF"];
    [dict setValue:self.UseTypeTF.text forKey:@"UseTypeTF"];
    [dict setValue:self.RunTypeTF.text forKey:@"RunTypeTF"];
    vc.dict = dict;
    vc.pos = @"1";
    [self.navigationController pushViewController:vc animated:nil];
}

- (UITextField *)pronameTF {
    if(_pronameTF == nil) {
        _pronameTF = [[UITextField alloc] init];
        _pronameTF.borderStyle = UITextBorderStyleRoundedRect;
        _pronameTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _pronameTF.backgroundColor = [UIColor whiteColor];
        _pronameTF.placeholder = @"    请输入您要检索的构件名称";
        [self.view addSubview:_pronameTF];
        [_pronameTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(50);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(45);
        }];
    }
    return _pronameTF;
}

- (UITextField *)CodeTypeTF {
    if(_CodeTypeTF == nil) {
        _CodeTypeTF = [[UITextField alloc] init];
        _CodeTypeTF.borderStyle = UITextBorderStyleRoundedRect;
        _CodeTypeTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _CodeTypeTF.placeholder = @"    请输入您要检索的构件语言类型";
        _CodeTypeTF.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_CodeTypeTF];
        [_CodeTypeTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.pronameTF.mas_bottom).mas_equalTo(2);
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
        _UseTypeTF.placeholder = @"    请输入您要检索的构件用法";
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
        _RunTypeTF.placeholder = @"    请输入您要检索的构件运行环境";
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

- (UIButton *)searchBtn {
    if(_searchBtn == nil) {
        _searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_searchBtn.layer setMasksToBounds:YES];
        [_searchBtn.layer setCornerRadius:5];
        [_searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
        [_searchBtn setBackgroundColor:[UIColor grayColor]];
        [self.view addSubview:_searchBtn];
        [_searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.RunTypeTF.mas_bottom).mas_equalTo(20);
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-20);
        }];
    }
    return _searchBtn;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent*)event{

    [self.pronameTF resignFirstResponder];
    [self.CodeTypeTF resignFirstResponder];
    [self.RunTypeTF resignFirstResponder];
    [self.UseTypeTF resignFirstResponder];

}

- (SearchOpenListTableView *)tableView {
    if (!_tableView) {
        _tableView = [[SearchOpenListTableView alloc] initWithFrame:CGRectZero];
    }
    return _tableView;
}

- (SearchBarView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[SearchBarView alloc] initWithFrame:CGRectZero];
        _scrollView.backgroundColor = [UIColor whiteColor];
    }
    return _scrollView;
}

@end
