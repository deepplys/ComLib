//
//  enterButCell.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/22.
//

#import "enterButCell.h"
#import <Masonry/Masonry.h>
#import <YYKit/YYKit.h>
#import <Masonry/Masonry.h>
#import <BlocksKit/BlocksKit.h>
#import <BlocksKit/UIControl+BlocksKit.h>
#import <BmobSDK/Bmob.h>

@interface enterButCell ()

@property (nonatomic, strong)UIButton *registerBtn;

@end

@implementation enterButCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = 2.f;
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    [self addSubview:self.registerBtn];
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self);
    }];
    [super updateConstraints];
}

- (UIButton *)registerBtn {
    if(_registerBtn == nil) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerBtn.layer setMasksToBounds:YES];
        [_registerBtn.layer setCornerRadius:5];
        [_registerBtn setTitle:@"创建" forState:UIControlStateNormal];
        [_registerBtn setBackgroundColor:[UIColor grayColor]];
        [_registerBtn bk_addEventHandler:^(id sender) {
            // 使用 Bmob后端云的 注册服务
            [self.delegate save];        
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerBtn;
}


@end
