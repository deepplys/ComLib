//
//  CommonStyleOneCell.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/3/30.
//

#import "CommonStyleOneCell.h"
#import <Masonry/Masonry.h>
#import <YYKit/YYKit.h>
#import "UIColor+Hex.h"

/*
 icon    name
         time status
 title
 简介
         like commit
 */

@interface CommonStyleOneCell ()

@property (nonatomic, strong)UIImageView *icon;
@property (nonatomic, strong)UILabel *name;
@property (nonatomic, strong)UILabel *time;
@property (nonatomic, strong)UILabel *status;
@property (nonatomic, strong)UILabel *title;
@property (nonatomic, strong)UILabel *info;
@property (nonatomic, strong)UILabel *like;
@property (nonatomic, strong)UILabel *commit;

@end

@implementation CommonStyleOneCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = 2.f;
        self.layer.borderColor=[UIColor blackColor].CGColor;
        self.layer.borderWidth=0.5; 
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
    [self.icon setImage:[UIImage imageNamed:@"avatar_default"]];
}

- (void)makeConstraints {
    
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView);
        make.height.width.equalTo(@(40));
    }];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.icon.mas_right);
        make.right.top.equalTo(self.contentView);
        make.height.equalTo(@(20));
    }];
    [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.name);
        make.bottom.equalTo(self.icon);
        make.width.equalTo(@(180));
        make.height.equalTo(@(20));
    }];
    [self.status mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.time);
        make.right.equalTo(self.contentView);
        make.left.equalTo(self.time.mas_right);
    }];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.icon.mas_bottom);
        make.height.equalTo(@(20));
        make.left.right.equalTo(self.contentView);
    }];
    [self.info mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.title.mas_bottom);
        make.bottom.equalTo(self.like.mas_top);
        make.left.right.equalTo(self.contentView);
    }];
    [self.like mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.info.mas_bottom);
        make.bottom.equalTo(self.contentView);
        make.right.equalTo(self.commit.mas_left);
        make.width.equalTo(@(100));
        make.height.equalTo(@(20));
    }];
    [self.commit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.info.mas_bottom);
        make.bottom.right.equalTo(self.contentView);
        make.width.equalTo(@(40));
        make.height.equalTo(@(20));
    }];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)updateData {
    // 通过日期组件对象获取日期某一部分,不需要给日期加8小时就能获取本地时间.这让笔者感到困惑.
    //    获取当前时间(格林尼治时间)
    NSDate *localDate = [NSDate date];
    
    // 创建日期组件对象
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];

    // 创建日历对象
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    // 给日期组件对象赋值
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday;
    dateComponents = [calendar components:unitFlags fromDate:localDate];
    NSString *data = [[NSString alloc]initWithFormat:@"%ld月 %ld日，%ld年",dateComponents.month,dateComponents.month,dateComponents.year];
    self.time.text = data;
    CALayer *layer = [self.icon layer];
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:2.0];
    [layer setBorderWidth:1];
    [layer setBorderColor:[[UIColor blackColor] CGColor]];
    self.icon.layer.cornerRadius = self.icon.height/2;
    self.icon.layer.masksToBounds = YES;
}

- (void)configWithCom:(ComTrue *)item {
    self.title.text = item.base.comName;
    self.info.text = item.base.comIntro;
    self.info.preferredMaxLayoutWidth = self.width;
    self.name.text = item.ownerID;
    self.time.text = item.createdAt;
    self.like.text = [[NSString alloc] initWithFormat:@"%d人点赞",item.like.intValue];
}

+ (CGSize)cellSizeWithWidth:(CGFloat)width {
    CGSize size = CGSizeMake(width, 140);
    return size;
}

+ (CGSize)cellSizeWithWidth:(CGFloat)width withInfo:(NSString *)info {
    UILabel *fakelabel = [[UILabel alloc] init];
    fakelabel.preferredMaxLayoutWidth = width;
    fakelabel.text = info;
    fakelabel.numberOfLines = 0;
    fakelabel.font = [UIFont systemFontOfSize:14];
    fakelabel.lineBreakMode = NSLineBreakByWordWrapping;
    CGFloat height = [fakelabel sizeThatFits:CGSizeMake(width, MAXFLOAT)].height;
    return CGSizeMake(width, height + 60 + 25);
}


- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] initWithFrame:CGRectZero];
        _icon.backgroundColor = [UIColor clearColor];
        ////icon.layer.cornerRadius = 8.f;
    }
    return _icon;
}


- (UILabel *)name {
    if (!_name) {
        _name = [[UILabel alloc] initWithFrame:CGRectZero];
        _name.text = @"姓名";
        _name.numberOfLines = 1;
        _name.font = [UIFont systemFontOfSize:18];
        _name.textColor = [UIColor colorWithHexString:ColorPrimaryText];;
    }
    return _name;
}

- (UILabel *)time {
    if (!_time) {
        _time = [[UILabel alloc] initWithFrame:CGRectZero];
        _time.text = @"时间";
        _time.numberOfLines = 1;
        _time.font = [UIFont systemFontOfSize:14];
        _time.textColor = [UIColor colorWithHexString:ColorSecondaryText];
    }
    return _time;
}

- (UILabel *)status {
    if (!_status) {
        _status = [[UILabel alloc] initWithFrame:CGRectZero];
        _status.text = @"发布了构件";
        _status.numberOfLines = 1;
        _status.font = [UIFont systemFontOfSize:14];
        _status.textColor = [UIColor colorWithHexString:ColorSecondaryText];
    }
    return _status;
}

- (UILabel *)title {
    if (!_title) {
        _title = [[UILabel alloc] initWithFrame:CGRectZero];
        _title.text = @"Search API USE";
        _title.numberOfLines = 1;
        _title.font = [UIFont systemFontOfSize:18];
        _title.textColor = [UIColor colorWithHexString:ColorPrimaryText];
    }
    return _title;
}

- (UILabel *)info {
    if (!_info) {
        _info = [[UILabel alloc] initWithFrame:CGRectZero];
        _info.text = @"The Search API helps you search for the specific item you want to find. For example, you can find a user or a specific file in a repository. Think of it the way you think of performing a search on Google.";
        _info.numberOfLines = 0;
        _info.lineBreakMode = NSLineBreakByWordWrapping;
        _info.font = [UIFont systemFontOfSize:14];
        _info.textColor = [UIColor colorWithHexString:ColorInfo];
    }
    return _info;
}

- (UILabel *)like {
    if (!_like) {
        _like = [[UILabel alloc] initWithFrame:CGRectZero];
        _like.text = @"点赞";
        _like.numberOfLines = 1;
        _like.font = [UIFont systemFontOfSize:14];
        _like.textColor = [UIColor colorWithHexString:ColorInfo];
    }
    return _like;
}

- (UILabel *)commit {
    if (!_commit) {
        _commit = [[UILabel alloc] initWithFrame:CGRectZero];
        _commit.text = @"评论";
        _commit.numberOfLines = 1;
        _commit.font = [UIFont systemFontOfSize:14];
        _commit.textColor = [UIColor colorWithHexString:ColorInfo];
    }
    return _commit;
}

@end
