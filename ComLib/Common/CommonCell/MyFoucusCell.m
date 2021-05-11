//
//  MyFoucusCell.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/3/24.
//

#import "MyFoucusCell.h"
#import <YYKit/YYKit.h>
#import <Masonry/Masonry.h>

@interface MyFoucusCell ()

@property (nonatomic, strong)UIImageView *avtarImageView;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *detailLabel;
@property (nonatomic, strong)UILabel *editLabel;
@property (nonatomic, strong)UIImageView *editImageView;

@end

@implementation MyFoucusCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = 2.f;
        [self setupSubViews];
        [self updateUI];
        [self addGesture];
    }
    return self;
}

- (void)updataInfoWithModel:(NSObject *)model {
    
}

- (void)setupSubviews {
    self.backgroundColor = [UIColor blueColor];
}

+ (CGSize)cellSizeWithWidth:(CGFloat)width {
    CGSize size = CGSizeMake(width, 100);
    return size;
}

- (void)setupSubViews {
    [self addSubview:self.avtarImageView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.detailLabel];
    [self addSubview:self.editLabel];
    [self addSubview:self.editImageView];
    CGFloat height = self.frame.size.height / 3;
    CGFloat leftMargan = 8.f;
    CGFloat topMargan = 4.f;
    [self.avtarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(leftMargan));
        make.top.equalTo(@(topMargan));
        make.width.height.equalTo(@(height*2-topMargan*2));
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avtarImageView.mas_right).offset(topMargan);
        make.top.offset(topMargan+1);
        make.right.equalTo(self);
        make.height.equalTo(@(height-topMargan-2));
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(2);
        make.height.equalTo(self.nameLabel.mas_height);
        make.left.right.equalTo(self.nameLabel);
    }];
    [self.editLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(self.editImageView);
    }];
    [self.editImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(topMargan));
        make.left.equalTo(@(leftMargan*2));
        make.right.equalTo(@(-leftMargan*2));
        make.height.equalTo(@(height-topMargan));
    }];
    [super updateConstraints];
}

- (void)addGesture {
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickEdit)];
    [self.editImageView addGestureRecognizer:tapGestureRecognizer];
}

- (void)clickEdit {
    NSLog(@"clickEdit");
    if ([self.delegate respondsToSelector:@selector(dispalyEditView)]) {
        [self.delegate dispalyEditView];
    }
}

- (void)updateUI {
    CALayer *layer = [self.editImageView layer];
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:2.0];
    [layer setBorderWidth:1];
    [layer setBorderColor:[[UIColor blackColor] CGColor]];
    _avtarImageView.layer.cornerRadius = _avtarImageView.height/2;
    _avtarImageView.layer.masksToBounds = YES;
}

- (UIImageView *)avtarImageView {
    if (!_avtarImageView) {
        _avtarImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _avtarImageView.backgroundColor = [UIColor clearColor];
    }
    return _avtarImageView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
        _nameLabel.textColor = [UIColor blackColor];
    }
    return _nameLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _detailLabel.backgroundColor = [UIColor clearColor];
        _detailLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        _detailLabel.textColor = [UIColor blackColor];
    }
    return _detailLabel;
}

- (UILabel *)editLabel {
    if (!_editLabel) {
        _editLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _editLabel.backgroundColor = [UIColor clearColor];
        _editLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
        _editLabel.text = @"编辑档案";
        _editLabel.textColor = [UIColor blackColor];
    }
    return _editLabel;
}

- (UIImageView *)editImageView {
    if (!_editImageView) {
        _editImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _editImageView.backgroundColor = [UIColor clearColor];
        _editImageView.contentMode = UIViewContentModeScaleAspectFit;
        _editImageView.userInteractionEnabled = YES;
    }
    return _editImageView;
}

@end
