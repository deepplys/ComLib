//
//  HeadCell.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/9.
//

#import "HeadCell.h"
#import <Masonry/Masonry.h>
#import <WHKit/WHKit.h>

@interface HeadCell ()

@property (nonatomic, strong)UIImageView *avtarImageView;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *detailLabel;
@property (nonatomic, strong)UILabel *editLabel;
@property (nonatomic, strong)UIImageView *editImageView;
@property (nonatomic, strong)UIView *view;
@property (nonatomic, strong)UILabel *profile;
@property (nonatomic, strong)UIImageView *file;

@property (nonatomic, strong)UIImageView *loginImage;

@end

@implementation HeadCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubViews];
        [self updateUI];
        [self addGesture];
    }
    return self;
}

+ (CGSize)cellSizeWithWidth:(CGFloat)width {
    CGSize size = CGSizeMake(width, 90);
    return size;
}

- (void)updataInfoWithModel:(UserInfosModel *)model {
    [self.avtarImageView setImage:[UIImage imageNamed:@"headImage"]];
    self.nameLabel.text = model.user.name;
    self.detailLabel.text = model.user.detail;
}

- (void)setupSubViews {
    [self addSubview:self.avtarImageView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.detailLabel];
    [self addSubview:self.editLabel];
    [self addSubview:self.editImageView];
    [self addSubview:self.view];
    [self.view addSubview:self.profile];
    [self.view addSubview:self.file];
    [self addSubview:self.loginImage];
    CGFloat height = self.frame.size.height / 3;
    CGFloat leftMargan = 8.f;
    CGFloat topMargan = 4.f;
    [self.avtarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(leftMargan));
        make.top.equalTo(@(topMargan));
        make.width.height.equalTo(@(height*2-topMargan*2));
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avtarImageView.mas_right).offset(topMargan);
        make.top.offset(topMargan+1);
        make.right.equalTo(self);
        make.height.equalTo(@(height-topMargan-2));
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(2);
        make.height.equalTo(self.nameLabel.mas_height);
        make.left.right.equalTo(self.nameLabel);
    }];
    [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.avtarImageView.mas_top).offset(20);
        make.bottom.equalTo(self.avtarImageView.mas_bottom).offset(-20);
        make.right.equalTo(self).offset(-10);
        make.width.equalTo(@(70));
    }];
    [self.profile mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self.view);
        make.width.equalTo(@(50));
    }];
    [self.file mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.equalTo(self.view);
        make.width.equalTo(@(20));
    }];
    [self.editLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(self.editImageView);
    }];
    [self.editImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.avtarImageView.mas_bottom).offset(topMargan*2);
        make.left.equalTo(@(leftMargan*2));
        make.right.equalTo(@(-leftMargan*2));
        make.height.equalTo(@(height-topMargan));
    }];
    [self.loginImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.right.equalTo(self);
        make.height.equalTo(self);
    }];
    [super updateConstraints];
    [self layoutIfNeeded];
}

- (void)addGesture {
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickEdit)];
    [self.editImageView addGestureRecognizer:tapGestureRecognizer];
    
    UITapGestureRecognizer *tapGestureRecognizer1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jumpLoginVC)];
    [self.loginImage addGestureRecognizer:tapGestureRecognizer1];
    
    UITapGestureRecognizer *tapGestureRecognizer2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jumpDetailVC)];
    [self.profile addGestureRecognizer:tapGestureRecognizer2];
    
    UITapGestureRecognizer *tapGestureRecognizer3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jumpDetailVC)];
    [self.file addGestureRecognizer:tapGestureRecognizer3];
    
}

- (void)jumpLoginVC {
    [self.delegate jumpLogin];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.login && [self.login isEqual:@"0"]) {
        [self jumpLoginVC];
    }
}

- (void)jumpDetailVC {
    [self.delegate jumpDetail];
}

- (void)setLogin:(NSString *)login {
    _login = login;
    if (login && [login isEqual:@"1"]) {
        [self.loginImage removeFromSuperview];
        self.loginImage.hidden = YES;
    } else {
        self.loginImage.hidden = NO;
    }
}

- (void)clickEdit {
    NSLog(@"clickEdit");
    if ([self.delegate respondsToSelector:@selector(dispalyEditView)]) {
        [self.delegate dispalyEditView];
    }
}

- (void)updateUI {
    CALayer *layer = [self.editImageView layer];
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:2.0];
    [layer setBorderWidth:1];
    [layer setBorderColor:[[UIColor blackColor] CGColor]];
    _avtarImageView.layer.cornerRadius = _avtarImageView.height/2;
    _avtarImageView.layer.masksToBounds = YES;
}

- (UIImageView *)avtarImageView {
    if (!_avtarImageView) {
        _avtarImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _avtarImageView.backgroundColor = [UIColor clearColor];
        _avtarImageView.layer.cornerRadius = 8.f;
    }
    return _avtarImageView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
        _nameLabel.textColor = [UIColor blackColor];
    }
    return _nameLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _detailLabel.backgroundColor = [UIColor clearColor];
        _detailLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        _detailLabel.textColor = [UIColor blackColor];
    }
    return _detailLabel;
}

- (UILabel *)editLabel {
    if (!_editLabel) {
        _editLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _editLabel.backgroundColor = [UIColor clearColor];
        _editLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
        _editLabel.text = @"编辑档案";
        _editLabel.textColor = [UIColor blackColor];
    }
    return _editLabel;
}

- (UIImageView *)editImageView {
    if (!_editImageView) {
        _editImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _editImageView.backgroundColor = [UIColor clearColor];
        _editImageView.contentMode = UIViewContentModeScaleAspectFit;
        _editImageView.userInteractionEnabled = YES;
    }
    return _editImageView;
}

- (UIView *)view {
    if (!_view) {
        _view = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _view;
}

- (UILabel *)profile {
    if (!_profile) {
        _profile = [[UILabel alloc] initWithFrame:CGRectZero];
        _profile.backgroundColor = [UIColor clearColor];
        _profile.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        _profile.text = @"个人主页";
        _profile.textColor = [UIColor grayColor];
    }
    return _profile;
}

- (UIImageView *)file {
    if (!_file) {
        _file = [[UIImageView alloc] initWithFrame:CGRectZero];
        _file.backgroundColor = [UIColor clearColor];
        _file.contentMode = UIViewContentModeScaleAspectFit;
        _file.image = [UIImage imageNamed:@"ic_arrow"];
        _file.userInteractionEnabled = YES;
    }
    return _file;
}

- (UIImageView *)loginImage {
    if (!_loginImage) {
        _loginImage = [[UIImageView alloc] initWithFrame:CGRectZero];
        _loginImage.backgroundColor = [UIColor whiteColor];
        _loginImage.contentMode = UIViewContentModeScaleAspectFit;
        _loginImage.image = [UIImage imageNamed:@"unlogin"];
        _loginImage.userInteractionEnabled = YES;
    }
    return _loginImage;
}

@end
