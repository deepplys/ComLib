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
#import "NSCommitDefine.h"
#import "WatchComCombineVC.h"
#import "DataSaveView.h"

@interface DerailInfoVC () <DetailInfoDataSourcesDelegate, CommitLikeCombineViewDelegate, WatchComCombineVCDelegate,DataSaveViewDelegate>

@property (nonatomic, strong)ComTrue *dict;
@property (nonatomic, strong)DetailInfoHeaderVIew *header;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) CommitLikeCombineView *bottomBar;
@property (nonatomic, strong) DataSaveView *dataSave;

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
    [self.view addSubview:self.dataSave];
    //self.header.frame = CGRectMake(0, 0, self.view.width, 100);
    self.collectionView.frame = CGRectMake(0, 0, self.view.width, self.view.height - 200);
    self.bottomBar.frame = CGRectMake(0, self.view.height - 200, self.view.width, 200);
    self.dataSave.frame = CGRectMake(self.view.width - 40, self.view.height - 240, 40, 40);
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

- (void)saveData {
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES)lastObject];
    // 拼接文件路径
    NSString *path = [doc stringByAppendingPathComponent:@"ComDownload.plist"];
    NSMutableArray *dataArray = [NSMutableArray arrayWithContentsOfFile:path];
    if (!dataArray) {
        dataArray = [[NSMutableArray alloc] init];
    }
    [dataArray addObject:@{self.dict.base.comName:self.dict.url}];
    [dataArray writeToFile:path atomically:YES];
}

- (void)jumpDetailVC {
    WatchComCombineVC *vc = [[WatchComCombineVC alloc] init];
    [self.navigationController pushViewController:vc animated:nil];
    vc.delegate = self;
}

- (void)backVC {
    [self.navigationController popViewControllerAnimated:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)jumpCommitVC {
    [[ZMCusCommentManager shareManager] showCommentWithComObjId:self.dataSources.recommendModel.dict.objectId WithAuthorID:@"fb02eddd45"];
}

- (CommitLikeCombineView *)bottomBar {
    if (!_bottomBar) {
        _bottomBar = [[CommitLikeCombineView alloc] initWithFrame:CGRectZero];
        _bottomBar.delegate = self;
        _bottomBar.proObjectId = self.dict.objectId;
        if (self.dict.isLike) {
            _bottomBar.isLike = @"1";
        } else {
            _bottomBar.isLike = @"0";
        }
        if (self.dict.isAdd) {
            _bottomBar.isAdd = @"1";
        } else {
            _bottomBar.isAdd = @"0";
        }
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

- (DataSaveView *)dataSave {
    if (!_dataSave) {
        _dataSave = [[DataSaveView alloc] initWithFrame:CGRectZero];
        _dataSave.delegate = self;
    }
    return _dataSave;
}

@end
