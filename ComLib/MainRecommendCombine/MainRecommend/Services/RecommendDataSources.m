//
//  RecommendDataSources.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/8.
//

#import "RecommendDataSources.h"
#import "RecommendCell.h"
#import "RecommenHeadCell.h"

static NSString * const RecommendCellIdentifier = @"RecommendCellIdentifier";
static NSString * const RecommenHeadCellIdentifier = @"RecommenHeadCellIdentifier";

@implementation RecommendDataSources

- (void)updateInfos:(NSMutableArray *)Infos {

}

- (void)registCollectionViewCells:(UICollectionView *)collectionView {
    [collectionView registerClass:[RecommendCell class]
       forCellWithReuseIdentifier:RecommendCellIdentifier];
    [collectionView registerClass:[RecommenHeadCell class]
       forCellWithReuseIdentifier:RecommenHeadCellIdentifier];

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 8;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return [self recommendHeadCellInCollectionView:collectionView atIndexPath:indexPath];
    } else {
        return [self recommendCellInCollectionView:collectionView atIndexPath:indexPath];
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = collectionView.frame.size.width;
    if (indexPath.row == 0) {
        return [RecommenHeadCell cellSizeWithWidth:width];
    } else {
        return [RecommendCell cellSizeWithWidth:width];
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

@end