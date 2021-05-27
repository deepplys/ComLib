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
#import "DetailInfoDataSources.h"

@interface DerailInfoVC () <DetailInfoDataSourcesDelegate>

@property (nonatomic, copy)NSDictionary *dict;
@property (nonatomic, strong)DetailInfoHeaderVIew *header;
@property (nonatomic, strong) DetailInfoDataSources *dataSources;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation DerailInfoVC

- (instancetype)initWithData:(NSDictionary *)dict {
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
    //self.header.frame = CGRectMake(0, 0, self.view.width, 100);
    self.collectionView.frame = CGRectMake(0, 0, self.view.width, self.view.height - 100);
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
        _dataSources.collection = _collectionView;
        [_dataSources registCollectionViewCells:_collectionView];
        _dataSources.delegate = self;
        _collectionView.delegate = _dataSources;
        _collectionView.dataSource = _dataSources;
    }
    return _collectionView;
}

- (void)didSelectItemInfo:(NSDictionary *)dict {
    DerailInfoVC *vc = [[DerailInfoVC alloc] initWithData:dict];
    vc.title = @"test";
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:nil];
}

- (DetailInfoHeaderVIew *)header {
    if (!_header) {
        _header = [[DetailInfoHeaderVIew alloc] init];
    }
    return _header;
}

@end
