//
//  CommonNavigationBackBar.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/13.
//

#import "CommonNavigationBackBar.h"
#import <Masonry/Masonry.h>

@interface CommonNavigationBackBar ()

@property (nonatomic, strong)UIImageView *back;

@end


@implementation CommonNavigationBackBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self back];
        [self setGesture];
    }
    return self;
}

- (void)setGesture {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backTo)];
    [self.back addGestureRecognizer:tap];
}

- (void)backTo {
    [self.delegate backToVC];
}

#pragma mark - 懒加载

- (UIImageView *)back {
    if (!_back) {
        _back = [[UIImageView alloc] initWithFrame:CGRectZero];
        _back.backgroundColor = [UIColor clearColor];
        _back.contentMode = UIViewContentModeScaleAspectFit;
        _back.userInteractionEnabled = YES;
        _back.image = [UIImage imageNamed:@"ic_back"];
        [self addSubview:_back];
        [_back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self);
            make.left.mas_equalTo(0);
            make.height.mas_equalTo(self);
            make.width.mas_offset(45);
        }];
    }
    return _back;
}

@end
