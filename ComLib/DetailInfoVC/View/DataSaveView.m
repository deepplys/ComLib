//
//  DataSaveView.m
//  ComLib
//
//  Created by cuixianglong on 2021/6/11.
//

#import "DataSaveView.h"
#import <Masonry/Masonry.h>

@implementation DataSaveView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
        [self setActionGes];
    }
    return self;
}

- (void)setupSubviews {
    [self addSubview:self.download];
    [self.download mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
    }];
}

- (void)setActionGes {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(saveData)];
    [self.download addGestureRecognizer:tap];
}

- (void)saveData {
    [self.delegate saveData];
}

- (UILabel *)download {
    if (!_download) {
        _download = [[UILabel alloc] initWithFrame:CGRectZero];
        _download.text = @"下载";
        _download.numberOfLines = 1;
        _download.font = [UIFont systemFontOfSize:18];
    }
    return _download;
}

@end
