//
//  DerailInfoVC.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/3.
//

#import "DerailInfoVC.h"
#import "DetailInfoHeaderVIew.h"
#import <YYKit/YYKit.h>

@interface DerailInfoVC ()

@property (nonatomic, copy)NSDictionary *dict;
@property (nonatomic, strong)DetailInfoHeaderVIew *header;
@end

@implementation DerailInfoVC

- (instancetype)initWithData:(NSDictionary *)dict {
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
    [self.view addSubview:self.header];
    self.header.frame = CGRectMake(0, 0, self.view.width, 100);
    // Do any additional setup after loading the view.
}

- (DetailInfoHeaderVIew *)header {
    if (!_header) {
        _header = [[DetailInfoHeaderVIew alloc] init];
    }
    return _header;
}

@end
