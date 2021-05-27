//
//  ComCell.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/22.
//

#import "ComCell.h"
#import <Masonry/Masonry.h>

@interface ComCell ()

@property (nonatomic, readwrite)UITextField *RunTypeTF;

@end

@implementation ComCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = 2.f;
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    [self addSubview:self.RunTypeTF];
    CGFloat headTab = 6.f;
    [self.RunTypeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self);
    }];
    [super updateConstraints];
}


- (void)setInfo:(NSString *)info {
    _info = info;
    self.RunTypeTF.placeholder = info;
}

+ (CGSize)cellSizeWithWidth:(CGFloat)width {
    CGSize size = CGSizeMake(width, 45);
    return size;
}


- (UITextField *)RunTypeTF {
    if(_RunTypeTF == nil) {
        _RunTypeTF = [[UITextField alloc] init];
        _RunTypeTF.borderStyle = UITextBorderStyleRoundedRect;
        _RunTypeTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _RunTypeTF.placeholder = @"    请输入您的构件运行环境";
        _RunTypeTF.backgroundColor = [UIColor whiteColor];
    }
    return _RunTypeTF;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return [textField resignFirstResponder];
}

@end
