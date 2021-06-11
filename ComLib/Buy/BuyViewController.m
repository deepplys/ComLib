//
//  BuyViewController.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/3/19.
//

#import "BuyViewController.h"
#import "BuyHeaderView.h"
#import <Masonry/Masonry.h>
#import "BuyDataSources.h"
#import "NSObjectGetStatus.h"
#import "BuyItemView.h"
#import <YYKit/YYKit.h>
#import "UIFocusAndFansViewController.h"

@interface BuyViewController () <BuyItemViewDelegate, UIFocusAndFansViewControllerDelegate>

@property (nonatomic, strong) BuyDataSources *dataSources;
@property (nonatomic, strong) UITableView *tabView;
@property (nonatomic, strong) BuyHeaderView *headerView;
@property (nonatomic, strong) BuyItemView *itemView;

@end

@implementation BuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //[self.view addSubview:self.tabView];
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.itemView];
    CGFloat statusBarH = [NSObjectGetStatus statusBarH];
    //self.headerView.frame = CGRectMake(0, statusBarH, self.view.width, 40);
    //self.itemView.frame = CGRectMake(0, 40+statusBarH, self.view.width, 40);
    //self.tabView.frame = CGRectMake(0, 100+statusBarH, self.view.width, self.view.height- (100+statusBarH));
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)displayVC {
    UIFocusAndFansViewController *vc = [[UIFocusAndFansViewController alloc] init];
    vc.isShow = YES;
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:nil];
}

- (void)backVC {
    [self.navigationController popViewControllerAnimated:nil];
}

- (UITableView *)tabView {
    if (!_tabView) {
        _tabView = [[UITableView alloc] initWithFrame:CGRectZero];
        _tabView.contentInset = UIEdgeInsetsZero;
        _tabView.backgroundColor = [UIColor clearColor];
        _tabView.backgroundView.backgroundColor = [UIColor clearColor];
        _tabView.showsVerticalScrollIndicator = NO;
        //delegate
        _dataSources = [[BuyDataSources alloc] init];
        _dataSources.collection = _tabView;
        [_dataSources registTabViewCells:_tabView];
        _dataSources.delegate = self;
        _tabView.delegate = _dataSources;
        _tabView.dataSource = _dataSources;
    }
    return _tabView;
}

- (BuyHeaderView *)headerView {
    if (!_headerView) {
        CGFloat statusBarH = [NSObjectGetStatus statusBarH];
        _headerView = [[BuyHeaderView alloc] initWithFrame:CGRectMake(0, statusBarH, self.view.width, 40)];
    }
    return _headerView;
}

- (BuyItemView *)itemView {
    if (!_itemView) {
        CGFloat statusBarH = [NSObjectGetStatus statusBarH];
        _itemView = [[BuyItemView alloc] initWithFrame:CGRectMake(0, 40+statusBarH, self.view.width, 60)];
        _itemView.delegate = self;
    }
    return _itemView;
}
@end
