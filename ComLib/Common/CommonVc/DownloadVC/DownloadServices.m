//
//  DownloadServices.m
//  ComLib
//
//  Created by cuixianglong on 2021/6/11.
//

#import "DownloadServices.h"
#import "BuyCell.h"

static NSString * const BuyCellIdentifier = @"BuyCellIdentifier";

@implementation DownloadServices

- (void)registTabViewCells:(UITableView *)tableView {
    [tableView registerClass:[BuyCell class] forCellReuseIdentifier:BuyCellIdentifier];
}

- (void)updateInfos:(NSMutableArray *)Infos {
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self BuyCellInCollectionView:tableView atIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (BuyCell *)BuyCellInCollectionView:(UITableView *)tableView
                                                        atIndexPath:(NSIndexPath *)indexPath {
    
    BuyCell *buyCell = [tableView dequeueReusableCellWithIdentifier:BuyCellIdentifier forIndexPath:indexPath];
    NSDictionary *dict = (NSDictionary *)[self.array objectAtIndex:indexPath.row];
    NSArray *arr = dict.allKeys;
    for (id obj in arr) {
        NSString *str = (NSString *)obj;
        buyCell.topText = str;
        buyCell.detailText = (NSString *)[dict objectForKey:str];
    }
    return buyCell;
}

- (NSMutableArray *)array {
    if (!_array) {
        _array = [[NSMutableArray alloc] init];
    }
    return _array;
}

@end
