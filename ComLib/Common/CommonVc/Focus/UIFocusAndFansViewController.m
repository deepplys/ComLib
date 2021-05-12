//
//  UIFocusAndFansViewController.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/3/31.
//

#import "UIFocusAndFansViewController.h"
#import <Masonry/Masonry.h>
#import "FocusInfoDataSource.h"
#import <YYKit/YYKit.h>
#import "NSObjectGetStatus.h"

@interface UIFocusAndFansViewController ()

@property (nonatomic, strong)UILabel *foucs;
@property (nonatomic, strong)UILabel *fans;
@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong)UIImageView *back;
@property (nonatomic, strong)FocusInfoDataSource *dataSources;

@end

@implementation UIFocusAndFansViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.userInteractionEnabled = YES;
    // Do any additional setup after loading the view.
    [self.view addSubview:self.foucs];
    [self.view addSubview:self.fans];
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.back];
    [self setGesture];
}

- (void)setIsShow:(BOOL)isShow {
    CGFloat offsetH = [NSObjectGetStatus statusBarH];
    [self.back mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view).offset(offsetH);
        make.height.equalTo(@20);
        make.width.equalTo(@20);
    }];
    if (isShow) {
        [self.foucs mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(offsetH);
            make.height.equalTo(@20);
            make.centerX.equalTo(self.view.mas_centerX).offset(-20);
        }];
        [self.fans mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(offsetH);
            make.height.equalTo(@20);
            make.centerX.equalTo(self.view.mas_centerX).offset(20);
        }];
        [self.collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.view);
            make.top.equalTo(self.foucs.mas_bottom);
        }];
    } else {
        [self.foucs mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(offsetH);
            make.height.equalTo(@20);
            make.centerX.equalTo(self.view.mas_centerX);
        }];
        [self.collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
            //make.top.left.right.equalTo(self.view);
            make.left.right.bottom.equalTo(self.view);
            make.top.equalTo(self.foucs.mas_bottom);
        }];
    }
}

- (void)setGesture {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backTo)];
    [self.back addGestureRecognizer:tap];
}

- (void)backTo {
    [self.delegate backVC];
}
- (UIImageView *)back {
    if (!_back) {
        _back = [[UIImageView alloc] initWithFrame:CGRectZero];
        _back.backgroundColor = [UIColor clearColor];
        _back.contentMode = UIViewContentModeScaleAspectFit;
        _back.userInteractionEnabled = YES;
        _back.image = [UIImage imageNamed:@"ic_back"];
    }
    return _back;
}

- (UILabel *)foucs {
    if (!_foucs) {
        _foucs = [[UILabel alloc] initWithFrame:CGRectZero];
        _foucs.backgroundColor = [UIColor clearColor];
        _foucs.font = [UIFont systemFontOfSize:18 weight:UIFontWeightLight];
        _foucs.textColor = [UIColor blackColor];
        _foucs.text = @"关注";
    }
    return _foucs;
}

- (UILabel *)fans {
    if (!_fans) {
        _fans = [[UILabel alloc] initWithFrame:CGRectZero];
        _fans.backgroundColor = [UIColor clearColor];
        _fans.font = [UIFont systemFontOfSize:18 weight:UIFontWeightLight];
        _fans.textColor = [UIColor blackColor];
        _fans.text = @"粉丝";
    }
    return _fans;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 4.0;
        flowLayout.minimumInteritemSpacing = 4.0;
        //ui
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.contentInset = UIEdgeInsetsZero;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.backgroundView.backgroundColor = [UIColor clearColor];
        _collectionView.showsVerticalScrollIndicator = YES;
        _collectionView.scrollEnabled = YES;
        //delegate
        _dataSources = [[FocusInfoDataSource alloc] init];
        _dataSources.collection = _collectionView;
        [_dataSources registCollectionViewCells:_collectionView];
        _dataSources.delegate = self;
        _collectionView.delegate = _dataSources;
        _collectionView.dataSource = _dataSources;
    }
    return _collectionView;
}

@end
