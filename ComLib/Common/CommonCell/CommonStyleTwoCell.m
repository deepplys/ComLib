//
//  CommonStyleTwoCell.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/3/30.
//

#import "CommonStyleTwoCell.h"
#import <Masonry/Masonry.h>

/*
 title
 简介
        name like commit
 */

@interface CommonStyleTwoCell ()

@property (nonatomic, strong)UILabel *title;
@property (nonatomic, strong)UILabel *info;
@property (nonatomic, strong)UILabel *name;
@property (nonatomic, strong)UILabel *shownum;
@property (nonatomic, strong)UILabel *commit;

@end

@implementation CommonStyleTwoCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = 2.f;
        [self setupSubviews];
        [self updateData];
    }
    return self;
}

- (void)setupSubviews {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.title];
    [self addSubview:self.info];
    [self addSubview:self.name];
    [self addSubview:self.shownum];
    [self addSubview:self.commit];
    [self makeConstraints];
}

- (void)makeConstraints {
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.height.equalTo(@(20));
        make.left.right.equalTo(self.contentView);
    }];
    [self.info mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.top.equalTo(self.title.mas_bottom);
        make.height.equalTo(@(40));
    }];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.info.mas_bottom);
        make.left.equalTo(self.contentView);
        make.width.equalTo(@(40));
        make.height.equalTo(@(20));
    }];
    [self.shownum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.name);
        make.left.equalTo(self.name.mas_right);
        make.width.equalTo(@(60));
        make.height.equalTo(@(20));
    }];
    [self.commit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView);
        make.top.equalTo(self.name);
        make.width.equalTo(@(40));
        make.height.equalTo(@(20));
    }];
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
    NSString *data = [[NSString alloc]initWithFormat:@"%ld月 %ld日，星期%ld",dateComponents.month,dateComponents.month,dateComponents.weekday];
    self.shownum.text = data;
}

+ (CGSize)cellSizeWithWidth:(CGFloat)width {
    CGSize size = CGSizeMake(width, 90);
    return size;
}

- (UILabel *)title {
    if (!_title) {
        _title = [[UILabel alloc] initWithFrame:CGRectZero];
        _title.text = @"标题";
        _title.numberOfLines = 1;
        _title.font = [UIFont systemFontOfSize:18];
        _title.textColor = [UIColor blackColor];
        _title.backgroundColor = [UIColor blueColor];
    }
    return _title;
}

- (UILabel *)info {
    if (!_info) {
        _info = [[UILabel alloc] initWithFrame:CGRectZero];
        _info.text = @"简介";
        _info.numberOfLines = 0;
        _info.font = [UIFont systemFontOfSize:18];
        _info.textColor = [UIColor blackColor];
        _info.backgroundColor = [UIColor redColor];
    }
    return _info;
}

- (UILabel *)name {
    if (!_name) {
        _name = [[UILabel alloc] initWithFrame:CGRectZero];
        _name.text = @"作者";
        _name.numberOfLines = 1;
        _name.font = [UIFont systemFontOfSize:18];
        _name.textColor = [UIColor blackColor];
        _name.backgroundColor = [UIColor blueColor];
    }
    return _name;
}

- (UILabel *)shownum {
    if (!_shownum) {
        _shownum = [[UILabel alloc] initWithFrame:CGRectZero];
        _shownum.text = @"时间";
        _shownum.numberOfLines = 1;
        _shownum.font = [UIFont systemFontOfSize:18];
        _shownum.textColor = [UIColor blackColor];
        _shownum.backgroundColor = [UIColor redColor];
    }
    return _shownum;
}

- (UILabel *)commit {
    if (!_commit) {
        _commit = [[UILabel alloc] initWithFrame:CGRectZero];
        _commit.text = @"评论";
        _commit.numberOfLines = 1;
        _commit.font = [UIFont systemFontOfSize:18];
        _commit.textColor = [UIColor blackColor];
        _commit.backgroundColor = [UIColor blueColor];
    }
    return _commit;
}

@end
