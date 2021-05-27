//
//  ComTypeCell.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/24.
//

#import "ComTypeCell.h"
#import "DetailInfoHeaderVIew.h"
#import <YYKit/YYKit.h>
#import <Masonry/Masonry.h>

/*
 cell 样式
 标题
   构件标识 cell
 
 构件基本新
 
 刻面            构件的内容
 构件基本信息    构件名称    构件简介    构件版本   
 构件分类信息    构件领域    语言类型    构件功能简述
 构件环境信息    运行环境    构件配置    构件依赖情况
 构件质量信息    构件可复用次数    构件规范性    构件稳定性
 构件功能信息    请求功能    提供功能    接口参数
 */

@interface ComTypeCell ()

@property (nonatomic, strong)DetailInfoHeaderVIew *header;
@property (nonatomic, strong)UILabel *subtitle;
@property (nonatomic, strong)UILabel *fi;
@property (nonatomic, strong)UILabel *se;
@property (nonatomic, strong)UILabel *th;

@property (nonatomic, strong)UILabel *fidata;
@property (nonatomic, strong)UILabel *sedata;
@property (nonatomic, strong)UILabel *thdata;


@end

@implementation ComTypeCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = 2.f;
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.subtitle];
    [self addSubview:self.fi];
    [self addSubview:self.se];
    [self addSubview:self.th];
    [self addSubview:self.fidata];
    [self addSubview:self.sedata];
    [self addSubview:self.thdata];
    [self.subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.contentView);
        make.height.equalTo(@20);
    }];
    [self.fi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.subtitle.mas_bottom);
        make.left.right.equalTo(self.contentView);
        make.height.equalTo(@20);
    }];
    [self.fidata mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fi.mas_bottom);
        make.left.right.equalTo(self.contentView);
        make.bottom.equalTo(self.se.mas_top);
    }];
    [self.se mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fidata.mas_bottom);
        make.left.right.equalTo(self.contentView);
        make.height.equalTo(@20);
    }];
    [self.sedata mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.se.mas_bottom);
        make.left.right.equalTo(self.contentView);
        make.bottom.equalTo(self.th.mas_top);
    }];
    [self.th mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sedata.mas_bottom);
        make.left.right.equalTo(self.contentView);
        make.height.equalTo(@20);
    }];
    [self.thdata mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.th.mas_bottom);
        make.left.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
    }];
    [super updateConstraints];
    [super layoutIfNeeded];
}

- (void)updateDataWithType:(NSString *)type
                  withData:(NSString *)fi
                          :(NSString *)se
                          :(NSString *)th{
    if ([type isEqual:@"0"]) {
        self.subtitle.text = @"构件基本信息";
        self.fi.text = @"构件名称";
        self.se.text = @"构件简介";
        self.th.text = @"构件版本";
    } else if ([type isEqual:@"1"]) {
        self.subtitle.text = @"构件分类信息";
        self.fi.text = @"构件领域";
        self.se.text = @"语言类型";
        self.th.text = @"构件功能简述";
    } else if ([type isEqual:@"2"]) {
        self.subtitle.text = @"构件环境信息";
        self.fi.text = @"运行环境";
        self.se.text = @"构件配置";
        self.th.text = @"构件依赖情况";
    } else if ([type isEqual:@"3"]) {
        self.subtitle.text = @"构件质量信息";
        self.fi.text = @"构件可复用次数";
        self.se.text = @"构件规范性";
        self.th.text = @"构件稳定性";
    } else if ([type isEqual:@"4"]) {
        self.subtitle.text = @"构件功能信息";
        self.fi.text = @"请求功能";
        self.se.text = @"提供功能";
        self.th.text = @"接口参数";
    } else {
     /* 构件分类信息    构件领域    语言类型    构件功能简述
        构件环境信息    运行环境    构件配置    构件依赖情况
        构件质量信息    构件可复用次数    构件规范性    构件稳定性
        构件功能信息    请求功能    提供功能    接口参数 */
    }
    self.fidata.text = fi;
    self.sedata.text = se;
    self.thdata.text = th;
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


- (UILabel *)subtitle {
    if (!_subtitle) {
        _subtitle = [[UILabel alloc] initWithFrame:CGRectZero];
        _subtitle.text = @"姓名";
        _subtitle.numberOfLines = 1;
        _subtitle.font = [UIFont systemFontOfSize:18];
        _subtitle.textColor = [UIColor blackColor];
    }
    return _subtitle;
}

- (UILabel *)fi {
    if (!_fi) {
        _fi = [[UILabel alloc] initWithFrame:CGRectZero];
        _fi.text = @"姓名";
        _fi.numberOfLines = 1;
        _fi.font = [UIFont systemFontOfSize:18];
        _fi.textColor = [UIColor blackColor];
    }
    return _fi;
}

- (UILabel *)se {
    if (!_se) {
        _se = [[UILabel alloc] initWithFrame:CGRectZero];
        _se.text = @"姓名";
        _se.numberOfLines = 1;
        _se.font = [UIFont systemFontOfSize:18];
        _se.textColor = [UIColor blackColor];
    }
    return _se;
}

- (UILabel *)th {
    if (!_th) {
        _th = [[UILabel alloc] initWithFrame:CGRectZero];
        _th.text = @"姓名";
        _th.numberOfLines = 1;
        _th.font = [UIFont systemFontOfSize:18];
        _th.textColor = [UIColor blackColor];
    }
    return _th;
}

- (UILabel *)fidata {
    if (!_fidata) {
        _fidata = [[UILabel alloc] initWithFrame:CGRectZero];
        _fidata.text = @"姓名";
        _fidata.numberOfLines = 0;
        _fidata.font = [UIFont systemFontOfSize:18];
        _fidata.textColor = [UIColor blackColor];
    }
    return _fidata;
}

- (UILabel *)sedata {
    if (!_sedata) {
        _sedata = [[UILabel alloc] initWithFrame:CGRectZero];
        _sedata.text = @"姓名";
        _sedata.numberOfLines = 0;
        _sedata.font = [UIFont systemFontOfSize:18];
        _sedata.textColor = [UIColor blackColor];
    }
    return _sedata;
}

- (UILabel *)thdata {
    if (!_thdata) {
        _thdata = [[UILabel alloc] initWithFrame:CGRectZero];
        _thdata.text = @"姓名";
        _thdata.numberOfLines = 0;
        _thdata.font = [UIFont systemFontOfSize:18];
        _thdata.textColor = [UIColor blackColor];
    }
    return _thdata;
}



@end
