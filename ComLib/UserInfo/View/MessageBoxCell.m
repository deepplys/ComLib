//
//  MessageBoxCell.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/8.
//

#import "MessageBoxCell.h"
#import <Masonry/Masonry.h>

@interface MessageBoxCell ()

@property (nonatomic, strong)UILabel *topLabel;
@property (nonatomic, strong)UILabel *detailLabel;
@property (nonatomic, strong)UIImageView *arrowImageView;

@end

@implementation MessageBoxCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.borderWidth = 0.5;
    }
    return self;
}

- (void)setupSubviews {
    [self addSubview:self.topLabel];
    [self addSubview:self.detailLabel];
    [self addSubview:self.arrowImageView];
    CGFloat headTab = 8.f;
    [self.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(headTab));
        make.top.equalTo(@(headTab));
        make.right.equalTo(@20);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(headTab));
        make.top.equalTo(self.topLabel.mas_bottom);
        make.right.equalTo(self);
        make.height.equalTo(@20);
    }];
    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(@0);
        make.width.height.equalTo(@(self.frame.size.height));
    }];
    [super updateConstraints];
}

- (void)updateWithTopText:(NSString *)topText withDetailText:(NSString *)detailText {
    self.detailLabel.text = detailText;
    self.topLabel.text = topText;
}

+ (CGSize)cellSizeWithWidth:(CGFloat)width {
    CGSize size = CGSizeMake(width, 60);
    return size;
}

- (UILabel *)topLabel {
    if (!_topLabel) {
        _topLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _topLabel.text = @"探索";
        _topLabel.numberOfLines = 1;
        _topLabel.font = [UIFont systemFontOfSize:18];
        _topLabel.textColor = [UIColor blackColor];
    }
    return _topLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel= [[UILabel alloc] initWithFrame:CGRectZero];
        _detailLabel.text = @"more info";
        _detailLabel.numberOfLines = 1;
        _detailLabel.font = [UIFont systemFontOfSize:12];
        _detailLabel.textColor = [UIColor grayColor];
    }
    return _detailLabel;
}

- (UIImageView *)arrowImageView {
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc] init];// init with a image
        _arrowImageView.backgroundColor = [UIColor clearColor];
        _arrowImageView.contentMode = UIViewContentModeCenter;
        _arrowImageView.image = [UIImage imageNamed:@"ic_arrow"];
    }
    return _arrowImageView;
}


@end
