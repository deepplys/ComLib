//
//  DetailInfoDataSources.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/12.
//

#import "DetailInfoDataSources.h"
#import "RecommendCell.h"
#import "RecommenHeadCell.h"
#import "CommonStyleOneCell.h"
#import "DetailHeadCell.h"

static NSString * const RecommendCellIdentifier = @"RecommendCellIdentifier";
static NSString * const RecommenHeadCellIdentifier = @"RecommenHeadCellIdentifier";
static NSString * const CommonStyleOneCellIdentifier = @"CommonStyleOneCellIdentifier";
static NSString * const DetailHeadCellIdentifier = @"DetailHeadCellIdentifier";

@implementation DetailInfoDataSources

- (void)updateInfos:(NSMutableArray *)Infos {

}

- (void)registCollectionViewCells:(UICollectionView *)collectionView {
    [collectionView registerClass:[RecommendCell class]
       forCellWithReuseIdentifier:RecommendCellIdentifier];
    [collectionView registerClass:[RecommenHeadCell class]
       forCellWithReuseIdentifier:RecommenHeadCellIdentifier];
    [collectionView registerClass:[CommonStyleOneCell class] forCellWithReuseIdentifier:CommonStyleOneCellIdentifier];
    [collectionView registerClass:[DetailHeadCell class] forCellWithReuseIdentifier:DetailHeadCellIdentifier];

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 8;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return [self DetailHeadCellInCollectionView:collectionView atIndexPath:indexPath];
    } else {
        return [self commonStyleOneCellInCollectionView:collectionView atIndexPath:indexPath];
        //return [self recommendCellInCollectionView:collectionView atIndexPath:indexPath];
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = collectionView.frame.size.width;
    if (indexPath.row == 0) {
        return [DetailHeadCell cellSizeWithWidth:width];
    } else {
        return [CommonStyleOneCell cellSizeWithWidth:width];
        //return [RecommendCell cellSizeWithWidth:width];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row != 0) {
        NSDictionary *dict = [NSDictionary new];
        [self.delegate didSelectItemInfo:dict];
    }
}

- (RecommendCell *)recommendCellInCollectionView:(UICollectionView *)collectionView
                                     atIndexPath:(NSIndexPath *)indexPath {
    RecommendCell *recommendCell = [collectionView dequeueReusableCellWithReuseIdentifier:RecommendCellIdentifier forIndexPath:indexPath];
    return recommendCell;
}

- (RecommenHeadCell *)recommendHeadCellInCollectionView:(UICollectionView *)collectionView
                                                        atIndexPath:(NSIndexPath *)indexPath {
    RecommenHeadCell *recommenHeadCell = [collectionView dequeueReusableCellWithReuseIdentifier:RecommenHeadCellIdentifier forIndexPath:indexPath];
    return recommenHeadCell;
}

- (CommonStyleOneCell *)commonStyleOneCellInCollectionView:(UICollectionView *)collectionView
                                                        atIndexPath:(NSIndexPath *)indexPath {
    CommonStyleOneCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CommonStyleOneCellIdentifier forIndexPath:indexPath];
    return cell;
}

- (DetailHeadCell *)DetailHeadCellInCollectionView:(UICollectionView *)collectionView
                                                        atIndexPath:(NSIndexPath *)indexPath {
    DetailHeadCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DetailHeadCellIdentifier forIndexPath:indexPath];
    return cell;
}

@end
