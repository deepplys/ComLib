//
//  LikeRecommendCombineController.m
//  ComLib
//
//  Created by cuixianglong on 2021/4/21.
//

#import "LikeRecommendCombineController.h"
#import "LikePageRecommendController.h"
#import "NSObjectGetStatus.h"
#import <YYKit/YYKit.h>

@interface LikeRecommendCombineController ()

@property (nonatomic, strong)UIView *pageView;
@property (nonatomic, strong)LikePageRecommendController *pageViewController;

@end

@implementation LikeRecommendCombineController

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
    [self setupSubviews];
}

- (void)setupSubviews {
    CGFloat height = [NSObjectGetStatus statusBarH];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.pageView];
    self.pageView.frame = CGRectMake(0, height, self.view.width, self.view.height -height);
    [self addChildViewController:self.pageViewController];
    self.pageViewController.view.frame = self.pageView.frame;
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

- (LikePageRecommendController *)pageViewController {
    if (!_pageViewController) {
        _pageViewController = [[LikePageRecommendController alloc]init];
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
