//
//  RecommenHeadCell.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/8.
//

#import "RecommenHeadCell.h"
#import <Masonry/Masonry.h>

@interface RecommenHeadCell ()

@property (nonatomic, strong)UILabel *topLabel;
@property (nonatomic, strong)UILabel *dateLabel;

@end

@implementation RecommenHeadCell

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
    [self addSubview:self.topLabel];
    [self addSubview:self.dateLabel];
    CGFloat headTab = 8.f;
    [self.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(headTab));
        make.top.equalTo(@(headTab));
        make.right.equalTo(@20);
    }];
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(headTab));
        make.top.equalTo(self.topLabel.mas_bottom);
        make.right.equalTo(self);
        make.height.equalTo(@20);
    }];
    [super updateConstraints];
    [super layoutIfNeeded];
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
    self.dateLabel.text = data;
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

- (UILabel *)dateLabel {
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _dateLabel.text = @"more info";
        _dateLabel.numberOfLines = 1;
        _dateLabel.font = [UIFont systemFontOfSize:12];
        _dateLabel.textColor = [UIColor grayColor];
    }
    return _dateLabel;
}

@end
