//
//  SearchVC.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/9.
//

#import "SearchVC.h"
#import "SearchOpenListTableView.h"
#import "NSObjectGetStatus.h"
#import <Masonry/Masonry.h>
#import "SearchBarView.h"

@interface SearchVC ()

@property (nonatomic, strong)SearchOpenListTableView *tableView;
@property (nonatomic, strong)SearchBarView *scrollView;

@end

@implementation SearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.scrollView];
    CGFloat statusBarH = [NSObjectGetStatus statusBarH];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(statusBarH));
        make.left.right.equalTo(self.view);
        make.height.equalTo(@50);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scrollView.mas_bottom);
        make.left.right.bottom.equalTo(self.view);
    }];
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

- (SearchOpenListTableView *)tableView {
    if (!_tableView) {
        _tableView = [[SearchOpenListTableView alloc] initWithFrame:CGRectZero];
    }
    return _tableView;
}

- (SearchBarView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[SearchBarView alloc] initWithFrame:CGRectZero];
        _scrollView.backgroundColor = [UIColor whiteColor];
    }
    return _scrollView;
}

@end
