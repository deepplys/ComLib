//
//  DerailInfoVC.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/3.
//

#import "DerailInfoVC.h"
#import "DetailInfoHeaderVIew.h"
#import <YYKit/YYKit.h>
#import <Masonry/Masonry.h>
#import "NSObjectGetStatus.h"
#import "ComTrue.h"
#import "CommitLikeCombineView.h"
#import "ZMCusCommentView.h"

@interface DerailInfoVC () <DetailInfoDataSourcesDelegate, CommitLikeCombineViewDelegate>

@property (nonatomic, strong)ComTrue *dict;
@property (nonatomic, strong)DetailInfoHeaderVIew *header;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) CommitLikeCombineView *bottomBar;

@end

@implementation DerailInfoVC

- (instancetype)initWithData:(ComTrue *)dict {
    if (self = [super init]) {
        self.dict = dict;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.view addSubview:self.header];
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.bottomBar];
    //self.header.frame = CGRectMake(0, 0, self.view.width, 100);
    self.collectionView.frame = CGRectMake(0, 0, self.view.width, self.view.height - 200);
    self.bottomBar.frame = CGRectMake(0, self.view.height - 200, self.view.width, 200);
    // Do any additional setup after loading the view.
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
        _collectionView.showsVerticalScrollIndicator = NO;
        //delegate
        _dataSources = [[DetailInfoDataSources alloc] init];
        _dataSources.recommendModel.dict = self.dict;
        _dataSources.collection = _collectionView;
        [_dataSources registCollectionViewCells:_collectionView];
        _dataSources.delegate = self;
        _collectionView.delegate = _dataSources;
        _collectionView.dataSource = _dataSources;
    }
    return _collectionView;
}

- (void)didSelectItemInfo:(NSDictionary *)dict {
    /*DerailInfoVC *vc = [[DerailInfoVC alloc] initWithData:dict];
    vc.title = @"构件详情";
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:nil];
     */
}

- (void)jumpCommitVC {
    [[ZMCusCommentManager shareManager] showCommentWithSourceId:nil];
}

- (CommitLikeCombineView *)bottomBar {
    if (!_bottomBar) {
        _bottomBar = [[CommitLikeCombineView alloc] initWithFrame:CGRectZero];
        _bottomBar.delegate = self;
    }
    return _bottomBar;
}
 
- (DetailInfoHeaderVIew *)header {
    if (!_header) {
        _header = [[DetailInfoHeaderVIew alloc] init];
    }
    return _header;
}

- (ComTrue *)dict {
    if (!_dict) {
        _dict = [[ComTrue alloc] init];
    }
    return _dict;
}

@end
