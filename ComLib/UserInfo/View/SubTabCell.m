//
//  SubTabCell.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/9.
//

#import "SubTabCell.h"
#import <Masonry/Masonry.h>

@interface SubTabCell ()

@property (nonatomic, strong)UIImageView *setting;
@property (nonatomic, strong)UIImageView *permit;
@property (nonatomic, strong)UIImageView *like;
@property (nonatomic, strong)UIImageView *line;

@end

@implementation SubTabCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubViews];
    }
    return self;
}

+ (CGSize)cellSizeWithWidth:(CGFloat)width {
    CGSize size = CGSizeMake(width, 60);
    return size;
}

- (void)setupSubViews {
    [self addSubview:self.line];
    [self.line addSubview:self.setting];
    [self.line addSubview:self.permit];
    [self.line addSubview:self.like];
    CGFloat width = (self.frame.size.width-8*4)/3;
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self);
    }];
    [self.permit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.equalTo(self);
        make.width.equalTo(@(width));
        make.left.equalTo(@(8));
    }];
    [self.like mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.equalTo(self);
        make.width.equalTo(@(width));
        make.left.equalTo(self.permit.mas_right).offset(8);
    }];
    [self.setting mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.equalTo(self);
        make.width.equalTo(@(width));
        make.left.equalTo(self.like.mas_right).offset(8);
    }];
    [super updateConstraints];
}

- (UIImageView *)setting {
    if (!_setting) {
        _setting = [[UIImageView alloc] initWithFrame:CGRectZero];
        //_setting.backgroundColor = [UIColor blueColor];
        _setting.contentMode = UIViewContentModeCenter;
        _setting.image = [UIImage imageNamed:@"setting"];
    }
    return _setting;
}

- (UIImageView *)permit {
    if (!_permit) {
        _permit = [[UIImageView alloc] initWithFrame:CGRectZero];
        //_permit.backgroundColor = [UIColor blueColor];
        _permit.contentMode = UIViewContentModeCenter;
        _permit.image = [UIImage imageNamed:@"permit"];
    }
    return _permit;
}

- (UIImageView *)like {
    if (!_like) {
        _like = [[UIImageView alloc] initWithFrame:CGRectZero];
        //_like.backgroundColor = [UIColor blueColor];
        _like.contentMode = UIViewContentModeCenter;
        _like.image = [UIImage imageNamed:@"likeitem"];
    }
    return _like;
}

- (UIImageView *)line {
    if (!_line) {
        _line = [[UIImageView alloc] initWithFrame:CGRectZero];
        _line.backgroundColor = [UIColor whiteColor];
    }
    return _line;
}

@end
