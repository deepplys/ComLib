//
//  DownloadVC.m
//  ComLib
//
//  Created by cuixianglong on 2021/6/11.
//

#import "DownloadVC.h"
#import <YYKit/YYKit.h>
#import "DownloadServices.h"

@interface DownloadVC ()

@property (nonatomic) NSMutableArray *array;
@property (nonatomic, strong)UITableView *tabView;
@property (nonatomic, strong)DownloadServices *dataSources;

@end

@implementation DownloadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES)lastObject];
    // 拼接文件路径
    NSString *path = [doc stringByAppendingPathComponent:@"ComDownload.plist"];
    NSMutableArray *dataArray = [NSMutableArray arrayWithContentsOfFile:path];
    if (!dataArray) {
        dataArray = [[NSMutableArray alloc] init];
    }
    _array = dataArray;
    //3. 添加父视图
    [self.view addSubview:self.tabView];
    self.dataSources.array = _array;
    self.tabView.frame = self.view.frame;
    self.tabView.backgroundColor = [UIColor whiteColor];
    //4. 释放
        // Do any additional setup after loading the view.
}


- (UITableView *)tabView {
    if (!_tabView) {
        _tabView = [[UITableView alloc] initWithFrame:CGRectZero];
        _tabView.contentInset = UIEdgeInsetsZero;
        _tabView.backgroundColor = [UIColor clearColor];
        _tabView.backgroundView.backgroundColor = [UIColor clearColor];
        _tabView.showsVerticalScrollIndicator = NO;
        //delegate
        _dataSources = [[DownloadServices alloc] init];
        _dataSources.collection = _tabView;
        [_dataSources registTabViewCells:_tabView];
        _dataSources.delegate = self;
        _tabView.delegate = _dataSources;
        _tabView.dataSource = _dataSources;
    }
    return _tabView;
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

@end
