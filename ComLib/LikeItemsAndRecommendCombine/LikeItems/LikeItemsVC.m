//
//  LikeItemsVC.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/9.
//

#import "LikeItemsVC.h"
#import <Masonry/Masonry.h>
#import <MJRefresh/MJRefresh.h>
#import "LikeItemDataSources.h"
#import "LikeItemsHeaderView.h"
#import "NSObjectGetStatus.h"
#import "NSUserNameStatus.h"
#import "DerailInfoVC.h"

@interface LikeItemsVC () <LikeItemViewModelDelegate , LikeItemDataSourcesDelegate>

@property (nonatomic, strong) LikeItemDataSources *dataSources;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) LikeItemsHeaderView *headerView;

@end

@implementation LikeItemsVC

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
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    /*
    [self.view addSubview:self.headerView];
    CGFloat statusBarH = [NSObjectGetStatus statusBarH];
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.left.equalTo(self.view);
        make.top.offset(statusBarH);
        make.height.equalTo(@40);
    }];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_bottom);
        make.bottom.left.right.equalTo(self.view);
    }];
    */
    CGFloat statusBarH = [NSObjectGetStatus statusBarH];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.top.equalTo(self.view);
        make.top.equalTo(@(statusBarH));
    }];
    self.collectionView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        NSLog(@"reFresh");
    }];
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // 马上进入刷新状态
    [self.collectionView.mj_header beginRefreshing];
}

- (void)loadNewData {
    NSLog(@"wtf");
    BmobUser *user = [BmobUser currentUser];
    [self.dataSources.viewModel updateModelWithTabId:user.objectId];
    [self.collectionView reloadData];
    //[self.collectionView.mj_header endRefreshing];
}

- (void)didSelectItemInfo:(ComTrue *)dict {
    DerailInfoVC *vc = [[DerailInfoVC alloc] initWithData:dict];
    vc.title = @"构件详情";
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:nil];
}

- (void)endFrs {
    [self.collectionView reloadData];
    [self.collectionView.mj_header endRefreshing];
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
        _dataSources = [[LikeItemDataSources alloc] init];
        _dataSources.collection = _collectionView;
        [_dataSources registCollectionViewCells:_collectionView];
        _dataSources.delegate = self;
        _collectionView.delegate = _dataSources;
        _collectionView.dataSource = _dataSources;
    }
    return _collectionView;
}

- (LikeItemsHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[LikeItemsHeaderView alloc] init];
    }
    return _headerView;
}

@end
