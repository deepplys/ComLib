//
//  DetailHeadCell.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/15.
//

#import "DetailHeadCell.h"
#import "DetailInfoHeaderVIew.h"
#import <YYKit/YYKit.h>
#import <Masonry/Masonry.h>

@interface DetailHeadCell ()

@property (nonatomic, strong)DetailInfoHeaderVIew *header;

@end

@implementation DetailHeadCell

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
    [self addSubview:self.header];
    [self.header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self.contentView);
    }];
    [super updateConstraints];
    [super layoutIfNeeded];
}

- (void)configWithModel:(ComTrue *)item {
    self.header.name.text = item.ownerID;
    //self.header.
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
    //self.dateLabel.text = data;
}

+ (CGSize)cellSizeWithWidth:(CGFloat)width {
    CGSize size = CGSizeMake(width, 100);
    return size;
}

- (DetailInfoHeaderVIew *)header {
    if (!_header) {
        _header = [[DetailInfoHeaderVIew alloc] init];
    }
    return _header;
}

@end
