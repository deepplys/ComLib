//
//  WatchHeadCell.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/12.
//

#import "WatchHeadCell.h"
#import <Masonry/Masonry.h>
#import <YYKit/YYKit.h>

@interface WatchHeadCell ()

@property (nonatomic, strong)UIImageView *icon;
@property (nonatomic, strong)UILabel *title;
@property (nonatomic, strong)UILabel *status;

@end

@implementation WatchHeadCell

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
    [self addSubview:self.icon];
    [self addSubview:self.title];
    [self makeConstraints];
}

- (void)makeConstraints {
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.height.equalTo(@(20));
        make.left.right.equalTo(self.contentView);
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
    self.title.text = data;
}

+ (CGSize)cellSizeWithWidth:(CGFloat)width {
    CGSize size = CGSizeMake(width, 90);
    return size;
}

- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] initWithFrame:CGRectZero];
        _icon.backgroundColor = [UIColor clearColor];
        _icon.layer.cornerRadius = 8.f;
        _icon.image = [UIImage imageNamed:@"headImage"];
    }
    return _icon;
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

@end
