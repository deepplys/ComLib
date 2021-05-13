//
//  WatchComDatasource.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/12.
//

#import "WatchComDatasource.h"
#import "WatchHeadCell.h"
#import "CommonStyleFouCell.h"

static NSString * const WatchHeadCellIdentifier = @"WatchHeadCellIdentifier";
static NSString * const CommonStyleFouCellIdentifier = @"CommonStyleFouCellIdentifier";

@implementation WatchComDatasource

- (void)updateInfos:(NSMutableArray *)Infos {

}

- (void)registCollectionViewCells:(UICollectionView *)collectionView {
    [collectionView registerClass:[WatchHeadCell class]
       forCellWithReuseIdentifier:WatchHeadCellIdentifier];
    [collectionView registerClass:[CommonStyleFouCell class]
       forCellWithReuseIdentifier:CommonStyleFouCellIdentifier];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 8;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return [self WatchHeadCellInCollectionView:collectionView atIndexPath:indexPath];
    } else {
        return [self CommonStyleFouCellInCollectionView:collectionView atIndexPath:indexPath];
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = collectionView.frame.size.width;
    if (indexPath.row == 0) {
        return [WatchHeadCell cellSizeWithWidth:width];
    } else {
        return [CommonStyleFouCell cellSizeWithWidth:width];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row != 0) {
        NSDictionary *dict = [NSDictionary new];
        //[self.delegate didSelectItemInfo:dict];
    }
}

- (WatchHeadCell *)WatchHeadCellInCollectionView:(UICollectionView *)collectionView
                                     atIndexPath:(NSIndexPath *)indexPath {
    WatchHeadCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:WatchHeadCellIdentifier forIndexPath:indexPath];
    return cell;
}

- (CommonStyleFouCell *)CommonStyleFouCellInCollectionView:(UICollectionView *)collectionView
                                     atIndexPath:(NSIndexPath *)indexPath {
    CommonStyleFouCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CommonStyleFouCellIdentifier forIndexPath:indexPath];
    return cell;
}

@end
