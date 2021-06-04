//
//  CommitLikeCombineView.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/31.
//

#import "CommitLikeCombineView.h"
#import <BmobSDK/Bmob.h>
#import <Masonry.h>
#import <SVProgressHUD/SVProgressHUD.h>

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
        make.left.equalTo(self.commitInput.mas_right).offset(-5);
        make.width.equalTo(@50);
    }];
    [self.addLike mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.equalTo(self);
        make.left.equalTo(self.commit.mas_right).offset(-5);
        make.width.equalTo(@50);
    }];
    [self.like mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.right.equalTo(self);
        make.left.equalTo(self.addLike.mas_right).offset(-5);
    }];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)updateData {
    
}

- (void)setActionGes {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(setLikeStatus)];
    [self.like addGestureRecognizer:tap];
}

+ (CGSize)cellSizeWithWidth:(CGFloat)width {
    CGSize size = CGSizeMake(width, 60);
    return size;
}

- (void)setLikeStatus {
    BOOL status = YES;
    if ([self.like.backgroundColor isEqual:[UIColor redColor]]) {
        status = YES;
    } else {
        status = NO;
    }
    BmobUser *user = [BmobUser currentUser];
    if (status) {
        //点赞
        BmobObject *like = [[BmobObject alloc] initWithClassName:@"LikeDemo"];
        [like setObject:user forKey:@"user"];
        [like setObject:[BmobObject objectWithoutDataWithClassName:@"Component" objectId:self.proObjectId] forKey:@"post"];
        [like saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
            if (error) {
                NSString *errorDetail = error.description;
                [SVProgressHUD showErrorWithStatus:errorDetail];
            } else {
                self.like.backgroundColor = [UIColor blueColor];
                if (self.block) {
                    self.block();
                }
            }
        }];
    } else {
        BmobQuery *query = [[BmobQuery alloc] initWithClassName:@"LikeDemo"];
        [query whereKey:@"user" equalTo:user];
        [query whereKey:@"post" equalTo:[BmobObject objectWithoutDataWithClassName:@"Component" objectId:self.proObjectId]];
        [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
            if (error) {
                NSString *errorDetail = error.description;
                [SVProgressHUD showErrorWithStatus:errorDetail];
            } else {
                //删除点赞记录
                BmobObject *object = [array firstObject];
                [object deleteInBackgroundWithBlock:^(BOOL isSuccessful, NSError *error) {
                    if (error) {
                        NSString *errorDetail = error.description;
                        [SVProgressHUD showErrorWithStatus:errorDetail];
                    } else {
                        self.like.backgroundColor = [UIColor redColor];
                        if (self.block) {
                            self.block();
                        }
                    }
                }];
            }
        }];
    }
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
        _commit.backgroundColor = [UIColor blueColor];
    }
    return _commit;
}

- (UIImageView *)like {
    if (!_like) {
        _like = [[UIImageView alloc] initWithFrame:CGRectZero];
        _like.backgroundColor = [UIColor blackColor];
        _like.userInteractionEnabled = YES;
    }
    return _like;
}

@end
