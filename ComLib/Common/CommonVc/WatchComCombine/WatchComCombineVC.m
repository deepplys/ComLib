//
//  WatchComCombineVC.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/13.
//

#import "WatchComCombineVC.h"
#import "WatchComPageVC.h"
#import <YYKit/YYKit.h>
#import "NSObjectGetStatus.h"
#import "CommonNavigationBackBar.h"

@interface WatchComCombineVC () <CommonNavigationBackBarDelegate>

@property (nonatomic, strong)CommonNavigationBackBar *backBar;
@property (nonatomic, strong)UIView *pageView;
@property (nonatomic, strong)WatchComPageVC *pageViewController;

@end

@implementation WatchComCombineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubviews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)setupSubviews {
    CGFloat height = [NSObjectGetStatus statusBarH];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.backBar];
    [self.view addSubview:self.pageView];
    self.backBar.frame = CGRectMake(0, height, self.view.width, 50);
    self.pageView.frame = CGRectMake(0, 50+height, self.view.width, self.view.height - 50-height);
    [self addChildViewController:self.pageViewController];
    self.pageViewController.view.frame = self.pageView.frame;
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

- (void)configWithDict:(NSMutableDictionary *)dict {
    [self.pageViewController configStatus:dict];
}

- (CommonNavigationBackBar *)backBar {
    if (!_backBar) {
        _backBar = [[CommonNavigationBackBar alloc] initWithFrame:CGRectZero];
        _backBar.delegate = self;
    }
    return _backBar;
}

- (WatchComPageVC *)pageViewController {
    if (!_pageViewController) {
        _pageViewController = [[WatchComPageVC alloc]init];
        _pageViewController.name = self.name;
        _pageViewController.detail = self.detail;
        _pageViewController.objectId = self.objectId;
    }
    return _pageViewController;
}

- (UIView *)pageView {
    if (!_pageView) {
        _pageView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _pageView;
}

- (void)backToVC {
    [self.delegate backVC];
}

@end
