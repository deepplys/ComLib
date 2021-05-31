//
//  CommitLikeCombineView.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/31.
//

#import "CommitLikeCombineView.h"
#import <Masonry.h>

@interface CommitLikeCombineView () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *commitInput; //写评论
@property (nonatomic, strong) UIImageView *commit; //评论
@property (nonatomic, strong) UIImageView *addLike; //收藏
@property (nonatomic, strong) UIImageView *like; //点赞

@end

@implementation CommitLikeCombineView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
        [self updateData];
    }
    return self;
}

- (void)setupSubviews {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.commitInput];
    [self addSubview:self.commit];
    [self addSubview:self.addLike];
    [self addSubview:self.like];
    [self makeConstraints];
}

- (void)makeConstraints {
    [self.commitInput mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.equalTo(@100);
    }];
    [self.commit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.equalTo(self);
        make.left.equalTo(self.commitInput).offset(-5);
        make.width.equalTo(@50);
    }];
    [self.addLike mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.equalTo(self);
        make.left.equalTo(self.commit).offset(-5);
        make.width.equalTo(@50);
    }];
    [self.like mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.right.equalTo(self);
        make.left.equalTo(self.addLike).offset(-5);
    }];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)updateData {
    
}

+ (CGSize)cellSizeWithWidth:(CGFloat)width {
    CGSize size = CGSizeMake(width, 60);
    return size;
}

- (UITextField *)commitInput {
    if (!_commitInput) {
        _commitInput = [[UITextField alloc] initWithFrame:CGRectZero];
        _commitInput.text = @"写评论";
        _commitInput.layer.borderColor = [UIColor grayColor].CGColor;
        _commitInput.layer.borderWidth = 0.5;
        _commitInput.leftViewMode = UITextFieldViewModeAlways;
        _commitInput.userInteractionEnabled = YES;
        _commitInput.leftView = [[UIView alloc]initWithFrame:CGRectMake(0,0,8,0)];
        _commitInput.delegate = self;
    }
    return _commitInput;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self.delegate jumpCommitVC];
    return NO;
}

- (UIImageView *)commit {
    if (!_commit) {
        _commit = [[UIImageView alloc] initWithFrame:CGRectZero];
        _commit.backgroundColor = [UIColor redColor];
    }
    return _commit;
}

- (UIImageView *)addLike {
    if (!_commit) {
        _commit = [[UIImageView alloc] initWithFrame:CGRectZero];
        _commit.backgroundColor = [UIColor redColor];
    }
    return _commit;
}

- (UIImageView *)like {
    if (!_like) {
        _like = [[UIImageView alloc] initWithFrame:CGRectZero];
        _like.backgroundColor = [UIColor redColor];
    }
    return _like;
}

@end
