//
//  LikeItemsHeaderView.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/9.
//

#import "LikeItemsHeaderView.h"
#import <Masonry/Masonry.h>

@interface LikeItemsHeaderView ()

@property (nonatomic, strong)UILabel *editLabel;
@property (nonatomic, strong)UILabel *titleLabel;

@end

@implementation LikeItemsHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    [self addSubview:self.titleLabel];
    [self addSubview:self.editLabel];
    CGFloat headTab = 6.f;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    [self.editLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.height.equalTo(self.titleLabel);
        make.right.equalTo(self).offset(-headTab);
        make.width.equalTo(@30);
    }];
    [super updateConstraints];
}

- (UILabel *)editLabel {
    if (!_editLabel) {
        _editLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _editLabel.text = @"编辑";
        _editLabel.numberOfLines = 1;
        _editLabel.font = [UIFont systemFontOfSize:14];
        _editLabel.textColor = [UIColor blackColor];
        _editLabel.userInteractionEnabled = YES;
    }
    return _editLabel;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.text = @"收藏";
        _titleLabel.numberOfLines = 1;
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}
@end
