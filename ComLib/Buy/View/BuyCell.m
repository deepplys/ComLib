//
//  BuyCell.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/3/19.
//

#import "BuyCell.h"
#import <Masonry/Masonry.h>

@interface BuyCell ()

@property (nonatomic, strong)UIImageView *coverImageView;
@property (nonatomic, strong)UIImageView *arrowImageView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *nickNameLabel;

@end

@implementation BuyCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
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
    [self addSubview:self.arrowImageView];
    CGFloat headTab = 6.f;
    [self.coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self);
        make.width.height.equalTo(self.mas_height);
    }];
    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(headTab));
        make.right.equalTo(@(-headTab));
        make.height.width.equalTo(@20);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.coverImageView.mas_right);
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
    [self.arrowImageView addGestureRecognizer:tapGestureRecognizer];
}

- (void)jumpToDetail {
    if ([self.arrowImageView.backgroundColor isEqual:[UIColor redColor]]) {
        self.arrowImageView.backgroundColor = [UIColor blueColor];
    } else {
        self.arrowImageView.backgroundColor = [UIColor redColor];
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

- (UIImageView *)arrowImageView {
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc] init];// init with a image
        _arrowImageView.backgroundColor = [UIColor redColor];
        _arrowImageView.userInteractionEnabled = YES;
        _arrowImageView.image = [UIImage imageNamed:@"ic_arrow"];
    }
    return _arrowImageView;
}
@end
