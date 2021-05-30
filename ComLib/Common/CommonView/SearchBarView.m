//
//  SearchBarView.m
//  ComLib
//
//  Created by cuixianglong on 2021/4/18.
//

#import "SearchBarView.h"
#import <Masonry/Masonry.h>

@interface SearchBarView () <UITextFieldDelegate>

@property (nonatomic, strong)UITextField *searchbar;
@property (nonatomic, strong)UIImageView *search;

@end

@implementation SearchBarView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    [self addSubview:self.searchbar];
    [self addSubview:self.search];
    [self.searchbar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(8);
        make.left.equalTo(self).offset(8);
        make.bottom.equalTo(self).offset(-8);
        make.right.equalTo(self).offset(-30);
    }];
    [self.search mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(self);
        make.left.equalTo(self.searchbar.mas_right);
    }];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self.delegate jumpSearchVC];
    return NO;
}

- (UITextField *)searchbar {
    if (!_searchbar) {
        _searchbar = [[UITextField alloc] initWithFrame:CGRectZero];
        _searchbar.text = @"";
        _searchbar.layer.borderColor = [UIColor grayColor].CGColor;
        _searchbar.layer.borderWidth = 0.5;
        _searchbar.leftViewMode = UITextFieldViewModeAlways;
        _searchbar.userInteractionEnabled = YES;
        _searchbar.leftView = [[UIView alloc]initWithFrame:CGRectMake(0,0,8,0)];
        _searchbar.delegate = self;
    }
    return _searchbar;
}

- (UIImageView *)search {
    if (!_search) {
        _search = [[UIImageView alloc] init];
        _search.image = [UIImage imageNamed:@"ic_search"];
        _search.contentMode = UIViewContentModeCenter;
    }
    return _search;
}

@end
