//
//  MainPageRecommendController.m
//  ComLib
//
//  Created by cuixianglong on 2021/4/18.
//

#import "MainPageRecommendController.h"
#import "NSObjectGetStatus.h"
#import "MainRecommendVC.h"

@interface MainPageRecommendController ()

@end

@implementation MainPageRecommendController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    WMZPageParam *param = PageParam()
    .wMenuBgColorSet([UIColor whiteColor])
    .wTitleArrSet(@[@"推荐",@"关注",@"C++",@"Python",@"oc",@"Ruby",@"JavaScript"])
    .wMenuFixRightDataSet(@{@"image":@"home_wy_3",@"selectImage":@"more_select"})
    .wMenuImagePositionSet(PageBtnPositionLeft)
    .wViewControllerSet(^UIViewController *(NSInteger index) {
         MainRecommendVC *vc = [MainRecommendVC new];
         vc.page = index;
        long temp = (long)index;
        if (temp == 0) {
            vc.tabId = @"Recommend";
        } else if (temp == 1) {
            vc.tabId = @"focus";
        } else if (temp == 2) {
            vc.tabId = @"c++";
        } else if (temp == 3) {
            vc.tabId = @"python";
        } else if (temp == 4) {
            vc.tabId = @"Objectivce-C";
        } else if (temp == 5) {
            vc.tabId = @"Ruby";
        } else if (temp == 6) {
            vc.tabId = @"JavaScript";
        }
        NSLog(@"***** %ld",(long)index);
         return vc;
     })
    .wMenuTitleSelectColorSet([UIColor orangeColor])
    .wMenuPositionSet(PageMenuPositionNavi)
    //减掉导航栏高度+tabbar高度(根据实际情况)
    .wCustomDataViewHeightSet(^CGFloat(CGFloat nowY) {
        return nowY;
    })
    .wEventClickSet(^(id anyID, NSInteger index) {
        NSLog(@"标题点击%ld",index);
    })
    .wEventFixedClickSet(^(id anyID, NSInteger index) {
        NSLog(@"固定标题点击%ld",index);
        
    })
    .wTopSuspensionSet(YES)
    .wMenuAnimalSet(PageTitleMenuPDD);
    self.param = param;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

@end
