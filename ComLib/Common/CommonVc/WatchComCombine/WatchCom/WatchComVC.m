//
//  WatchComVC.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/12.
//

#import "WatchComVC.h"
#import "WatchComDatasource.h"
#import "DerailInfoVC.h"
#import <Masonry/Masonry.h>
#import <BlocksKit/BlocksKit.h>
#import "NSObjectGetStatus.h"
#import "WMZPageProtocol.h"
#import "DerailInfoVC.h"


@interface WatchComVC () <WatchComDatasourceDelegate>

@property (nonatomic, strong) WatchComDatasource *dataSources;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation WatchComVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupView];
}

- (void)setupView {
    [self.view addSubview:self.collectionView];
    CGFloat statusBarH = [NSObjectGetStatus statusBarH];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.top.equalTo(self.view);
        make.top.equalTo(@(statusBarH));
    }];
    self.collectionView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        NSLog(@"reFresh");
        [self.collectionView reloadData];
    }];
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // 马上进入刷新状态
    [self.collectionView.mj_header beginRefreshing];
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    self.collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}

- (void)endFresh {
    [self.collectionView reloadData];
    [self.collectionView.mj_header endRefreshing];
}

- (void)setName:(NSString *)name {
    _name = name;
    //设置完名字开始刷新
    //[self.collectionView.mj_header beginRefreshing];
}

- (void)loadNewData {
    NSLog(@"wtf");
    [self.dataSources.viewModel updateModelWithName:self.name];
    self.dataSources.viewModel.model.name = self.name;
    self.dataSources.viewModel.model.detail = self.detail;
    self.dataSources.viewModel.model.objectId = self.objectId;
    [self.collectionView reloadData];
}

- (void)loadMoreData {
    NSLog(@"tth");
    [self.collectionView.mj_footer beginRefreshing];
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
        _dataSources = [[WatchComDatasource alloc] init];
        _dataSources.collection = _collectionView;
        [_dataSources registCollectionViewCells:_collectionView];
        _dataSources.delegate = self;
        _collectionView.delegate = _dataSources;
        _collectionView.dataSource = _dataSources;
    }
    return _collectionView;
}

- (void)didSelectItemInfo:(ComTrue *)dict {
    DerailInfoVC *vc = [[DerailInfoVC alloc] initWithData:dict];
    vc.title = @"构件详情";
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:nil];
}


@end
