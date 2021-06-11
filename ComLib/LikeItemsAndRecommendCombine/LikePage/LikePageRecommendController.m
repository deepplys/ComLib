//
//  LikePageRecommendController.m
//  ComLib
//
//  Created by cuixianglong on 2021/4/21.
//

#import "LikePageRecommendController.h"
#import "LikeItemsVC.h"
#import "CreateNewCom.h"
#import "MainRecommendVC.h"

@interface LikePageRecommendController ()

@end

@implementation LikePageRecommendController

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
    WMZPageParam *param = PageParam()
    .wMenuBgColorSet([UIColor whiteColor])
    .wTitleArrSet(@[@"收藏",@"新鲜",@"新构件"])
    .wMenuWidthSet(PageVCWidth - 100)
    .wViewControllerSet(^UIViewController *(NSInteger index) {
        if (index == 0 ) {
            LikeItemsVC *vc = [LikeItemsVC new];
             vc.page = index;
             return vc;
        } else if (index == 2){
            CreateNewCom *vc = [CreateNewCom new];
            return vc;
        } else {
            MainRecommendVC *vc = [MainRecommendVC new];
            vc.page = index;
            vc.tabId = @"Recommend";
            return vc;
        }
     })
    .wMenuTitleSelectColorSet([UIColor orangeColor])
    .wMenuPositionSet(PageMenuPositionCenter)
    //减掉导航栏高度+tabbar高度(根据实际情况)
    .wCustomDataViewHeightSet(^CGFloat(CGFloat nowY) {
        return nowY;
    })
    .wEventClickSet(^(id anyID, NSInteger index) {
        NSLog(@"标题点击%ld",index);
    })
    .wTopSuspensionSet(YES)
    .wMenuAnimalSet(PageTitleMenuPDD);
    self.param = param;
}



@end
