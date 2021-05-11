//
//  UserInfosEditView.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/3/15.
//

#import "UserInfosEditView.h"
#import <WHKit/WHKit.h>
#import <Masonry/Masonry.h>

@interface UserInfosEditView () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate>

@property (nonatomic, strong) UIButton *saveButton;
@property (nonatomic, strong) UIButton *cancleButton;

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *detailLabel;

@end

@implementation UserInfosEditView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupView];
        [self addGesture];
    }
    return self;
}

- (void)setupView {
    [self addSubview:self.saveButton];
    [self addSubview:self.cancleButton];
    [self addSubview:self.avtarImageView];
    [self addSubview:self.nameField];
    [self addSubview:self.nameLabel];
    [self addSubview:self.detailField];
    [self addSubview:self.detailLabel];
    [self.cancleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.top.equalTo(self).offset(10);
        make.width.height.equalTo(@40);
    }];
    [self.saveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@-10);
        make.top.equalTo(self).offset(10);
        make.width.height.equalTo(@40);
    }];
    [self.avtarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.saveButton.mas_bottom).offset(10);
        make.height.width.equalTo(@(40));
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(8);
        make.width.equalTo(@40);
        make.height.equalTo(@40);
        make.top.equalTo(self.avtarImageView.mas_bottom);
    }];
    [self.nameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(8);
        make.right.equalTo(self).offset(-8);
        make.height.equalTo(@40);
        make.top.equalTo(self.nameLabel.mas_bottom);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(8);
        make.width.equalTo(@40);
        make.height.equalTo(@40);
        make.top.equalTo(self.nameField.mas_bottom).offset(8);
    }];
    [self.detailField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(8);
        make.right.equalTo(self).offset(-8);
        make.height.equalTo(@40);
        make.top.equalTo(self.detailLabel.mas_bottom);
    }];
    [super updateConstraints];
    _avtarImageView.layer.cornerRadius = _avtarImageView.height/2;
    _avtarImageView.layer.masksToBounds = YES;
}

- (void)addGesture {
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeUserIcon:)];
    [self.avtarImageView addGestureRecognizer:tapGes];
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tapGr.cancelsTouchesInView = NO;
    [self addGestureRecognizer:tapGr];
}

-(void)viewTapped:(UITapGestureRecognizer*)tapGr{
    [self endEditing:YES];
}

- (void)changeUserIcon:(UITapGestureRecognizer *)tap {
    [self.delegate openAlert];
}

- (void)backToFrontVC {
    if([self.delegate conformsToProtocol:@protocol(UserInfosEditViewDelegate)]
       && [self.delegate respondsToSelector:@selector(closeEditVC)]) {
        [self.delegate closeEditVC];
    }
}

- (UIButton *)saveButton {
    if (!_saveButton) {
        _saveButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [_saveButton setTitle:@"保存" forState:UIControlStateNormal];
        [_saveButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [_saveButton addTarget:self action:@selector(backToFrontVC) forControlEvents:UIControlEventTouchDown];
    }
    return _saveButton;
}

- (UIButton *)cancleButton {
    if (!_cancleButton) {
        _cancleButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [_cancleButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancleButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [_cancleButton addTarget:self action:@selector(backToFrontVC) forControlEvents:UIControlEventTouchDown];
    }
    return _cancleButton;
}

- (UIImageView *)avtarImageView {
    if (!_avtarImageView) {
        _avtarImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _avtarImageView.userInteractionEnabled = YES;
        _avtarImageView.image = [UIImage imageNamed:@"avatar_default"];
    }
    return _avtarImageView;
}

- (UITextField *)nameField {
    if (!_nameField) {
        _nameField = [[UITextField alloc] initWithFrame:CGRectZero];
        _nameField.text = @"";
        _nameField.layer.borderColor = [UIColor grayColor].CGColor;
        _nameField.layer.borderWidth = 0.5;
        _nameField.leftViewMode = UITextFieldViewModeAlways;
        _nameField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0,0,8,0)];
    }
    return _nameField;
}

- (UITextField *)detailField {
    if (!_detailField) {
        _detailField = [[UITextField alloc] initWithFrame:CGRectZero];
        _detailField.text = @"";
        _detailField.layer.borderColor = [UIColor grayColor].CGColor;
        _detailField.layer.borderWidth = 0.5;
        _detailField.leftViewMode = UITextFieldViewModeAlways;
        _detailField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0,0,8,0)];
    }
    return _detailField;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @"姓名";
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.numberOfLines = 1;
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.textColor = [UIColor grayColor];
    }
    return _nameLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel =[[UILabel alloc] initWithFrame:CGRectZero];
        _detailLabel.text = @"介绍";
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        _detailLabel.numberOfLines = 1;
        _detailLabel.font = [UIFont systemFontOfSize:12];
        _detailLabel.textColor = [UIColor grayColor];
    }
    return _detailLabel;
}

@end
