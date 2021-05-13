//
//  WatchComPageVC.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/13.
//

#import "WatchComPageVC.h"
#import "WatchComVC.h"
#import "HeadView.h"
#import "NSObjectGetStatus.h"
#import <YYKit/YYKit.h>
@interface WatchComPageVC ()

@property (nonatomic, strong)HeadView *header;

@end

@implementation WatchComPageVC

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
    [self.view addSubview:self.header];
    CGFloat height = [NSObjectGetStatus statusBarH];
    self.header.frame = CGRectMake(0, height, self.view.width, 50);
    WMZPageParam *param = PageParam()
    .wMenuBgColorSet([UIColor whiteColor])
    .wTitleArrSet(@[@"动态",@"构件库"])
    .wMenuWidthSet(PageVCWidth - 100)
    .wViewControllerSet(^UIViewController *(NSInteger index) {
        WatchComVC *vc = [WatchComVC new];
         vc.page = index;
         return vc;
     })
    .wMenuTitleSelectColorSet([UIColor orangeColor])
    //.wMenuPositionSet(PageMenuPositionCenter)
    .wMenuPositionSet(PageMenuPositionLeft)
    //减掉导航栏高度+tabbar高度(根据实际情况)
    .wCustomDataViewHeightSet(^CGFloat(CGFloat nowY) {
        return nowY ;
    })
    .wEventClickSet(^(id anyID, NSInteger index) {
        NSLog(@"标题点击%ld",index);
    })
    .wTopSuspensionSet(YES)
    .wMenuAnimalSet(PageTitleMenuPDD);
    self.param = param;
}

- (HeadView *)header {
    if (!_header) {
        _header = [[HeadView alloc] initWithFrame:CGRectZero];
        _header.backgroundColor = [UIColor clearColor];
    }
    return _header;
}

@end
