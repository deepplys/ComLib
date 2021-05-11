//
//  BuyItemView.m
//  ComLib
//
//  Created by cuixianglong on 2021/4/21.
//

#import "BuyItemView.h"
#import <Masonry/Masonry.h>
#import "UIFocusAndFansViewController.h"

@interface BuyItemView ()

@property (nonatomic, strong)UIImageView *commit;
@property (nonatomic, strong)UIImageView *fans;
@property (nonatomic, strong)UIImageView *like;
@property (nonatomic, strong)UIImageView *help;
@property (nonatomic, strong)UIImageView *line;
@property (nonatomic, strong)UILabel *f;
@property (nonatomic, strong)UILabel *l;
@property (nonatomic, strong)UILabel *h;
@property (nonatomic, strong)UILabel *c;

@end

@implementation BuyItemView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    [self addSubview:self.line];
    [self.line addSubview:self.commit];
    [self.line addSubview:self.fans];
    [self.line addSubview:self.like];
    [self.line addSubview:self.help];
    [self.line addSubview:self.c];
    [self.line addSubview:self.f];
    [self.line addSubview:self.l];
    [self.line addSubview:self.h];
    CGFloat width = (self.frame.size.width-8*4)/4;
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self);
    }];
    [self.fans mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.bottom.equalTo(self.f.mas_top);
        make.width.equalTo(@(width));
        make.left.equalTo(@(8));
    }];
    [self.f mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.height.equalTo(@(20));
        make.width.equalTo(@(width));
        make.left.equalTo(self.fans);
    }];
    [self.like mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.bottom.equalTo(self.l.mas_top);
        make.width.equalTo(@(width));
        make.left.equalTo(self.fans.mas_right).offset(8);
    }];
    [self.l mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.height.equalTo(@(20));
        make.width.equalTo(@(width));
        make.left.equalTo(self.like);
    }];
    [self.commit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.bottom.equalTo(self.c.mas_top);
        make.width.equalTo(@(width));
        make.left.equalTo(self.like.mas_right).offset(8);
    }];
    [self.c mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.height.equalTo(@(20));
        make.width.equalTo(@(width));
        make.left.equalTo(self.commit);
    }];
    [self.help mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.bottom.equalTo(self.h.mas_top);
        make.width.equalTo(@(width));
        make.left.equalTo(self.commit.mas_right).offset(8);
    }];
    [self.h mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.height.equalTo(@(20));
        make.width.equalTo(@(width));
        make.left.equalTo(self.help);
    }];
    [self setNeedsLayout];
    [self layoutIfNeeded];
    [self setupGesture];
}

- (void)setupGesture {
    UITapGestureRecognizer *reco = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(display)];
    UITapGestureRecognizer *reco1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(display)];
    [self.fans addGestureRecognizer:reco];
    [self.f addGestureRecognizer:reco1];
}

- (void)display {
    NSLog(@"2142142");
    [self.delegate displayVC];
}

- (UIImageView *)commit {
    if (!_commit) {
        _commit = [[UIImageView alloc] initWithFrame:CGRectZero];
        //_commit.backgroundColor = [UIColor blueColor];
        _commit.contentMode = UIViewContentModeScaleAspectFit;
        _commit.image = [UIImage imageNamed:@"commit"];
    }
    return _commit;
}

- (UILabel *)c {
    if (!_c) {
        _c = [[UILabel alloc] initWithFrame:CGRectZero];
        _c.backgroundColor = [UIColor clearColor];
        _c.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
        _c.text = @"评论";
        _c.textAlignment = NSTextAlignmentCenter;
        _c.textColor = [UIColor blackColor];
    }
    return _c;
}

- (UIImageView *)fans {
    if (!_fans) {
        _fans = [[UIImageView alloc] initWithFrame:CGRectZero];
        _fans.backgroundColor = [UIColor clearColor];
        _fans.contentMode = UIViewContentModeScaleAspectFit;
        _fans.image = [UIImage imageNamed:@"fans"];
        _fans.userInteractionEnabled = YES;
    }
    return _fans;
}

- (UILabel *)f {
    if (!_f) {
        _f = [[UILabel alloc] initWithFrame:CGRectZero];
        _f.backgroundColor = [UIColor clearColor];
        _f.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
        _f.text = @"粉丝";
        _f.textAlignment = NSTextAlignmentCenter;
        _f.textColor = [UIColor blackColor];
        _f.userInteractionEnabled = YES;
    }
    return _f;
}

- (UIImageView *)like {
    if (!_like) {
        _like = [[UIImageView alloc] initWithFrame:CGRectZero];
        //_like.backgroundColor = [UIColor blueColor];
        _like.contentMode = UIViewContentModeScaleAspectFit;
        _like.image = [UIImage imageNamed:@"likeNum"];
    }
    return _like;
}

- (UILabel *)l {
    if (!_l) {
        _l = [[UILabel alloc] initWithFrame:CGRectZero];
        _l.backgroundColor = [UIColor clearColor];
        _l.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
        _l.text = @"点赞";
        _l.textAlignment = NSTextAlignmentCenter;
        _l.textColor = [UIColor blackColor];
    }
    return _l;
}

- (UIImageView *)line {
    if (!_line) {
        _line = [[UIImageView alloc] initWithFrame:CGRectZero];
        _line.backgroundColor = [UIColor whiteColor];
        _line.userInteractionEnabled = YES;
    }
    return _line;
}

- (UIImageView *)help {
    if (!_help) {
        _help = [[UIImageView alloc] initWithFrame:CGRectZero];
        _help.contentMode = UIViewContentModeScaleAspectFit;
        _help.image = [UIImage imageNamed:@"help"];
    }
    return _help;
}

- (UILabel *)h {
    if (!_h) {
        _h = [[UILabel alloc] initWithFrame:CGRectZero];
        _h.backgroundColor = [UIColor clearColor];
        _h.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
        _h.text = @"帮助";
        _h.textAlignment = NSTextAlignmentCenter;
        _h.textColor = [UIColor blackColor];
    }
    return _h;
}

@end
