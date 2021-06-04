//
//  CommonStyleThrCell.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/3/31.
//

#import "CommonStyleThrCell.h"
#import <Masonry/Masonry.h>
#import <YYKit/YYKit.h>
#import <BmobSDK/Bmob.h>
#import <SVProgressHUD/SVProgressHUD.h>
/*
 
 关注 headCell
 icon    name   status
         detail
 */

@interface CommonStyleThrCell ()

@property (nonatomic, strong)UIImageView *icon;
@property (nonatomic, strong)UILabel *name;
@property (nonatomic, strong)UILabel *detail;
//@property (nonatomic, strong)UILabel *status;
@property (nonatomic, strong)UIImageView *status;
@property (nonatomic, assign)BOOL isfocus;
@property (nonatomic, copy)NSString *foucsObject;

@end

@implementation CommonStyleThrCell

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
    self.contentView.userInteractionEnabled = YES;
    [self addSubview:self.icon];
    [self addSubview:self.name];
    [self addSubview:self.detail];
    [self addSubview:self.status];
    [self makeConstraints];
    [self setGesture];
}

- (void)makeConstraints {
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView);
        make.height.width.equalTo(@(40));
    }];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.icon.mas_right);
        make.top.equalTo(self.icon);
        make.width.equalTo(@(40));
        make.height.equalTo(@(20));
    }];
    [self.detail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.name);
        make.bottom.equalTo(self.icon);
        make.width.equalTo(@(40));
        make.height.equalTo(@(20));
    }];
    [self.status mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.icon);
        make.right.equalTo(self.contentView.mas_right);
        make.width.equalTo(@50);
        make.height.equalTo(self.icon).offset(-10);
    }];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setGesture {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(change)];
    [self.status addGestureRecognizer:tap];
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jumpUserVC)];
    [self.name addGestureRecognizer:tap1];
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jumpUserVC)];
    [self.detail addGestureRecognizer:tap2];
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jumpUserVC)];
    [self.icon addGestureRecognizer:tap3];
}

- (void)jumpUserVC {
    [self.delegate jumpDetailVC];
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
    self.detail.text = @"text";
    CALayer *layer = [self.icon layer];
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:2.0];
    [layer setBorderWidth:1];
    [layer setBorderColor:[[UIColor blackColor] CGColor]];
    self.icon.layer.cornerRadius = self.icon.height/2;
    self.icon.layer.masksToBounds = YES;
}


- (void)configWithModel:(NSDictionary *)dict {
    NSMutableDictionary *dict1 = [NSMutableDictionary new];
    [dict1 setValue:@"Biz" forKey:@"name"];
    [dict1 setValue:@"totoooooo " forKey:@"detail"];
    [dict1 setValue:@"0" forKey:@"status"];
    self.name.text = [dict valueForKey:@"name"];
    self.detail.text = [dict valueForKey:@"detail"];
    NSString *temp = [dict valueForKey:@"status"];
    if (temp && [temp isEqual:@"1"]) {
        self.isfocus = YES;
        self.status.image = [UIImage imageNamed:@"focusdone"];
    } else {
        self.isfocus = NO;
        self.status.image = [UIImage imageNamed:@"focus"];
    }
}

+ (CGSize)cellSizeWithWidth:(CGFloat)width {
    CGSize size = CGSizeMake(width, 50);
    return size;
}


- (void)change {
    BOOL status = self.isfocus;
    BmobUser *user = [BmobUser currentUser];
    if (!status) {
        //点赞
        BmobObject *like = [[BmobObject alloc] initWithClassName:@"FocusDemo"];
        [like setObject:user forKey:@"user"];
        [like setObject:[BmobObject objectWithoutDataWithClassName:@"Component" objectId:self.foucsObject] forKey:@"post"];
        [like saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
            if (error) {
                NSString *errorDetail = error.description;
                [SVProgressHUD showErrorWithStatus:errorDetail];
            } else {
                self.isfocus = YES;
                self.status.image = [UIImage imageNamed:@"focusdone"];
            }
        }];
    } else {
        BmobQuery *query = [[BmobQuery alloc] initWithClassName:@"LikeDemo"];
        [query whereKey:@"user" equalTo:user];
        [query whereKey:@"post" equalTo:[BmobObject objectWithoutDataWithClassName:@"Component" objectId:self.foucsObject]];
        [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
            if (error) {
                NSString *errorDetail = error.description;
                [SVProgressHUD showErrorWithStatus:errorDetail];
            } else {
                //删除关注记录
                BmobObject *object = [array firstObject];
                [object deleteInBackgroundWithBlock:^(BOOL isSuccessful, NSError *error) {
                    if (error) {
                        NSString *errorDetail = error.description;
                        [SVProgressHUD showErrorWithStatus:errorDetail];
                    } else {
                        self.isfocus = NO;
                        self.status.image = [UIImage imageNamed:@"focus"];
                    }
                }];
            }
        }];
    }
}

- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] initWithFrame:CGRectZero];
        _icon.backgroundColor = [UIColor clearColor];
        _icon.layer.cornerRadius = 8.f;
        _icon.image = [UIImage imageNamed:@"headImage"];
        _icon.userInteractionEnabled = YES;
    }
    return _icon;
}

- (UILabel *)name {
    if (!_name) {
        _name = [[UILabel alloc] initWithFrame:CGRectZero];
        _name.text = @"姓名";
        _name.numberOfLines = 1;
        _name.font = [UIFont systemFontOfSize:18];
        _name.textColor = [UIColor blackColor];
        _name.userInteractionEnabled = YES;
    }
    return _name;
}

- (UILabel *)detail {
    if (!_detail) {
        _detail = [[UILabel alloc] initWithFrame:CGRectZero];
        _detail.text = @"细节";
        _detail.numberOfLines = 1;
        _detail.font = [UIFont systemFontOfSize:18];
        _detail.textColor = [UIColor blackColor];
        _detail.userInteractionEnabled = YES;
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

@end
