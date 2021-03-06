//
//  DetailInfoHeaderVIew.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/4.
//

#import "DetailInfoHeaderVIew.h"
#import <Masonry/Masonry.h>
#import <YYKit/YYKit.h>

@interface DetailInfoHeaderVIew ()


@end

@implementation DetailInfoHeaderVIew

- (instancetype)init {
    if (self = [super init]) {
        [self setupSubviews];
        [self updateData];
    }
    return self;
}

- (void)setupSubviews {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.icon];
    [self addSubview:self.name];
    [self addSubview:self.time];
    [self addSubview:self.status];
    [self addSubview:self.title];
    [self addSubview:self.info];
    [self addSubview:self.like];
    [self addSubview:self.commit];
    [self makeConstraints];
    [self.icon setImage:[UIImage imageNamed:@"headImage"]];
}

- (void)makeConstraints {
    
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self);
        make.height.width.equalTo(@(40));
    }];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.icon.mas_right);
        make.right.top.equalTo(self);
        make.height.equalTo(@(20));
    }];
    [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.name);
        make.bottom.equalTo(self.icon);
        make.width.equalTo(@(50));
        make.height.equalTo(@(20));
    }];
    [self.status mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.time);
        make.right.equalTo(self);
        make.left.equalTo(self.time.mas_right);
    }];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.icon.mas_bottom);
        make.height.equalTo(@(20));
        make.left.right.equalTo(self);
    }];
    [self.info mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.title.mas_bottom);
        make.bottom.equalTo(self);
        make.left.right.equalTo(self);
    }];
    [self.like mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.right.equalTo(self.commit.mas_left);
        make.width.equalTo(@(20));
        make.height.equalTo(@(20));
    }];
    [self.commit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.equalTo(self);
        make.width.equalTo(@(20));
        make.height.equalTo(@(20));
    }];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)updateData {
    // ????????????????????????????????????????????????,?????????????????????8??????????????????????????????.????????????????????????.
    //    ??????????????????(??????????????????)
    NSDate *localDate = [NSDate date];
    
    // ????????????????????????
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];

    // ??????????????????
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    // ???????????????????????????
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday;
    dateComponents = [calendar components:unitFlags fromDate:localDate];
    NSString *data = [[NSString alloc]initWithFormat:@"%ld??? %ld????????????%ld",dateComponents.month,dateComponents.month,dateComponents.weekday];
    self.time.text = data;
    CALayer *layer = [self.icon layer];
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:2.0];
    [layer setBorderWidth:1];
    [layer setBorderColor:[[UIColor blackColor] CGColor]];
    self.icon.layer.cornerRadius = self.icon.height/2;
    self.icon.layer.masksToBounds = YES;
}

+ (CGSize)cellSizeWithWidth:(CGFloat)width {
    CGSize size = CGSizeMake(width, 60);
    return size;
}

- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] initWithFrame:CGRectZero];
        _icon.backgroundColor = [UIColor clearColor];
        _icon.layer.cornerRadius = 8.f;
    }
    return _icon;
}


- (UILabel *)name {
    if (!_name) {
        _name = [[UILabel alloc] initWithFrame:CGRectZero];
        _name.text = @"??????";
        _name.numberOfLines = 1;
        _name.font = [UIFont systemFontOfSize:18];
        _name.textColor = [UIColor blackColor];
    }
    return _name;
}

- (UILabel *)time {
    if (!_time) {
        _time = [[UILabel alloc] initWithFrame:CGRectZero];
        _time.text = @"??????";
        _time.numberOfLines = 1;
        _time.font = [UIFont systemFontOfSize:18];
        _time.textColor = [UIColor blackColor];
    }
    return _time;
}

- (UILabel *)status {
    if (!_status) {
        _status = [[UILabel alloc] initWithFrame:CGRectZero];
        _status.text = @"??????";
        _status.numberOfLines = 1;
        _status.font = [UIFont systemFontOfSize:18];
        _status.textColor = [UIColor blackColor];
    }
    return _status;
}

- (UILabel *)title {
    if (!_title) {
        _title = [[UILabel alloc] initWithFrame:CGRectZero];
        _title.text = @"??????";
        _title.numberOfLines = 1;
        _title.font = [UIFont systemFontOfSize:18];
        _title.textColor = [UIColor blackColor];
    }
    return _title;
}

- (UILabel *)info {
    if (!_info) {
        _info = [[UILabel alloc] initWithFrame:CGRectZero];
        _info.text = @"??????";
        _info.numberOfLines = 0;
        _info.font = [UIFont systemFontOfSize:18];
        _info.textColor = [UIColor blackColor];
    }
    return _info;
}

- (UIButton *)like {
    if (!_like) {
        _like = [[UIButton alloc] initWithFrame:CGRectZero];
        _like.backgroundColor = [UIColor redColor];
    }
    return _like;
}

- (UILabel *)commit {
    if (!_commit) {
        _commit = [[UILabel alloc] initWithFrame:CGRectZero];
        _commit.text = @"??????";
        _commit.numberOfLines = 1;
        _commit.font = [UIFont systemFontOfSize:18];
        _commit.textColor = [UIColor blackColor];
    }
    return _commit;
}
@end
