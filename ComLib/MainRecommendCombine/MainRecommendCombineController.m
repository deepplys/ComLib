//
//  MainRecommendCombineController.m
//  ComLib
//
//  Created by cuixianglong on 2021/4/18.
//

#import "MainRecommendCombineController.h"
#import "SearchBarView.h"
#import "MainPageRecommendController.h"
#import <YYKit/YYKit.h>
#import "NSObjectGetStatus.h"
@interface MainRecommendCombineController ()

@property (nonatomic, strong)SearchBarView *searchBar;
@property (nonatomic, strong)UIView *pageView;
@property (nonatomic, strong)MainPageRecommendController *pageViewController;
@end

@implementation MainRecommendCombineController

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
    [self.view addSubview:self.searchBar];
    [self.view addSubview:self.pageView];
    self.searchBar.frame = CGRectMake(0, height, self.view.width, 50);
    self.pageView.frame = CGRectMake(0, 50+height, self.view.width, self.view.height - 50-height);
    [self addChildViewController:self.pageViewController];
    self.pageViewController.view.frame = self.pageView.frame;
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

- (SearchBarView *)searchBar {
    if (!_searchBar) {
        _searchBar = [[SearchBarView alloc] initWithFrame:CGRectZero];
        _searchBar.backgroundColor = [UIColor clearColor];
    }
    return _searchBar;
}

- (MainPageRecommendController *)pageViewController {
    if (!_pageViewController) {
        _pageViewController = [[MainPageRecommendController alloc]init];
    }
    return _pageViewController;
}

- (UIView *)pageView {
    if (!_pageView) {
        _pageView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _pageView;
}

@end
