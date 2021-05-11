//
//  BuyDataSources.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/3/19.
//

#import "BuyDataSources.h"
#import "BuyCell.h"

static NSString * const BuyCellIdentifier = @"BuyCellIdentifier";

@implementation BuyDataSources

- (void)registTabViewCells:(UITableView *)tableView {
    [tableView registerClass:[BuyCell class] forCellReuseIdentifier:BuyCellIdentifier];
}

- (void)updateInfos:(NSMutableArray *)Infos {
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
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
    [buyCell updateInfoWithModel];
    return buyCell;
}

@end
