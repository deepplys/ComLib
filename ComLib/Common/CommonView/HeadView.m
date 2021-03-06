//
//  HeadView.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/13.
//

#import "HeadView.h"
#import <Masonry/Masonry.h>
#import <YYKit/YYKit.h>

@interface HeadView ()

@property (nonatomic, strong)UIImageView *icon;
@property (nonatomic, strong)UILabel *name;
@property (nonatomic, strong)UILabel *detail;
//@property (nonatomic, strong)UILabel *status;
@property (nonatomic, strong)UIImageView *status;
@property (nonatomic, assign)BOOL isfocus;

@end


@implementation HeadView

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
    self.userInteractionEnabled = YES;
    self.userInteractionEnabled = YES;
    [self addSubview:self.icon];
    [self addSubview:self.name];
    [self addSubview:self.detail];
    [self addSubview:self.status];
    [self makeConstraints];
    [self setGesture];
}

- (void)updataWithDict:(NSMutableDictionary *)dict {
    self.name.text = [dict objectForKey:@"name"];
    self.detail.text = [dict objectForKey:@"detail"];
    /// to do focus status
}

- (void)makeConstraints {
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self);
        make.height.width.equalTo(@(40));
    }];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.icon.mas_right);
        make.top.equalTo(self.icon);
        make.width.equalTo(@(100));
        make.height.equalTo(@(20));
    }];
    [self.detail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.name);
        make.bottom.equalTo(self.icon);
        make.width.equalTo(@(100));
        make.height.equalTo(@(20));
    }];
    [self.status mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.icon);
        make.right.equalTo(self.mas_right);
        make.width.equalTo(@50);
        make.height.equalTo(self.icon).offset(-10);
    }];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setGesture {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(change)];
    [self.status addGestureRecognizer:tap];
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
    self.detail.text = @"text";
    CALayer *layer = [self.icon layer];
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:2.0];
    [layer setBorderWidth:1];
    [layer setBorderColor:[[UIColor blackColor] CGColor]];
    self.icon.layer.cornerRadius = self.icon.height/2;
    self.icon.layer.masksToBounds = YES;
}

+ (CGSize)cellSizeWithWidth:(CGFloat)width {
    CGSize size = CGSizeMake(width, 50);
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

- (UILabel *)detail {
    if (!_detail) {
        _detail = [[UILabel alloc] initWithFrame:CGRectZero];
        _detail.text = @"??????";
        _detail.numberOfLines = 1;
        _detail.font = [UIFont systemFontOfSize:18];
        _detail.textColor = [UIColor blackColor];
    }
    return _detail;
}

- (UIImageView *)status {
    if (!_status) {
        _status = [[UIImageView alloc] initWithFrame:CGRectZero];
        _status.image = [UIImage imageNamed:@"focus"];
        //_status.highlightedImage = [UIImage imageNamed:@"focusdone"];
        _isfocus = NO;
        _status.userInteractionEnabled = YES;
    }
    return _status;
}

- (void)change {
    if (self.isfocus) {
        self.status.image = [UIImage imageNamed:@"focus"];
    } else {
        self.status.image = [UIImage imageNamed:@"focusdone"];
    }
    self.isfocus = self.isfocus ? NO : YES;
}

@end
