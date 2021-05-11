//
//  LikeItemCell.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/9.
//

#import "LikeItemCell.h"
#import <Masonry/Masonry.h>

@interface LikeItemCell ()

@property (nonatomic, strong)UIImageView *coverImageView;
@property (nonatomic, strong)UIImageView *likeImageView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *nickNameLabel;

@end

@implementation LikeItemCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = 2.f;
        [self setupSubviews];
        [self addGesture];
    }
    return self;
}

- (void)setupSubviews {
    [self addSubview:self.coverImageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.nickNameLabel];
    [self addSubview:self.likeImageView];
    CGFloat headTab = 6.f;
    [self.coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.bottom.equalTo(self.nickNameLabel.mas_bottom);
    }];
    [self.likeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(headTab));
        make.right.equalTo(@(-headTab));
        make.height.width.equalTo(@20);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(headTab));
        make.bottom.equalTo(@(-headTab));
        make.right.equalTo(self);
        make.height.equalTo(@20);
    }];
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_left);
        make.bottom.equalTo(self.titleLabel.mas_top).offset(-1);
        make.height.equalTo(@17);
        make.right.equalTo(self);
    }];
    [super updateConstraints];
}

- (void)addGesture {
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jumpToDetail)];
    [self.likeImageView addGestureRecognizer:tapGestureRecognizer];
}

- (void)jumpToDetail {
    if ([self.likeImageView.backgroundColor isEqual:[UIColor redColor]]) {
        self.likeImageView.backgroundColor = [UIColor blueColor];
    } else {
        self.likeImageView.backgroundColor = [UIColor redColor];
    }
}

- (void)updateInfoWithModel {
    [self.coverImageView setImage:[UIImage imageNamed:@"com1"]];
    [self.nickNameLabel setText:@"拱门"];
}

+ (CGSize)cellSizeWithWidth:(CGFloat)width {
    CGSize size = CGSizeMake(width, width*4.0/3.0);
    return size;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.text = @"探索";
        _titleLabel.numberOfLines = 1;
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor blackColor];
        //_titleLabel.layer.borderColor = [UIColor blackColor].CGColor;
        //_titleLabel.layer.borderWidth = 0.5;
    }
    return _titleLabel;
}

- (UILabel *)nickNameLabel {
    if (!_nickNameLabel) {
        _nickNameLabel= [[UILabel alloc] initWithFrame:CGRectZero];
        _nickNameLabel.text = @"more info";
        _nickNameLabel.numberOfLines = 1;
        _nickNameLabel.font = [UIFont systemFontOfSize:12];
        _nickNameLabel.textColor = [UIColor grayColor];
        //_nickNameLabel.layer.borderColor = [UIColor blackColor].CGColor;
        //_nickNameLabel.layer.borderWidth = 1;
    }
    return _nickNameLabel;
}

- (UIImageView *)coverImageView {
    if (!_coverImageView) {
        _coverImageView = [[UIImageView alloc] init];// init with a image
        _coverImageView.backgroundColor = [UIColor clearColor];
        _coverImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _coverImageView;
}

- (UIImageView *)likeImageView {
    if (!_likeImageView) {
        _likeImageView = [[UIImageView alloc] init];// init with a image
        _likeImageView.backgroundColor = [UIColor redColor];
        _likeImageView.userInteractionEnabled = YES;
        _likeImageView.image = [UIImage imageNamed:@"ic_delete"];
    }
    return _likeImageView;
}

@end
