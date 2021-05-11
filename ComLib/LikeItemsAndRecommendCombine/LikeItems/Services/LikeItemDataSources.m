//
//  LikeItemDataSources.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/9.
//

#import "LikeItemDataSources.h"
#import "LikeItemCell.h"
#import "CommonStyleTwoCell.h"
static NSString * const LikeItemCellIdentifier = @"LikeItemCellIdentifier";
static NSString * const CommonStyleTwoCellIdentifier = @"CommonStyleTwoCellIdentifier";

@implementation LikeItemDataSources

- (void)updateInfos:(NSMutableArray *)Infos {
    
}

- (void)registCollectionViewCells:(UICollectionView *)collectionView {
    [collectionView registerClass:[LikeItemCell class]
       forCellWithReuseIdentifier:LikeItemCellIdentifier];
    [collectionView registerClass:[CommonStyleTwoCell class] forCellWithReuseIdentifier:CommonStyleTwoCellIdentifier];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 9;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self CommonStyleTwoCellInInCollectionView:collectionView atIndexPath:indexPath];
    //return [self LikeItemCellInCollectionView:collectionView atIndexPath:indexPath];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = (collectionView.frame.size.width - 4*2);
    return [CommonStyleTwoCell cellSizeWithWidth:width];
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 4.f, 12.f, 4);
}

- (LikeItemCell *)LikeItemCellInCollectionView:(UICollectionView *)collectionView
                                   atIndexPath:(NSIndexPath *)indexPath {
    LikeItemCell *LikeItemCell = [collectionView dequeueReusableCellWithReuseIdentifier:LikeItemCellIdentifier forIndexPath:indexPath];
    [LikeItemCell updateInfoWithModel];
    return LikeItemCell;
}

- (CommonStyleTwoCell *)CommonStyleTwoCellInInCollectionView:(UICollectionView *)collectionView
                                                 atIndexPath:(NSIndexPath *)indexPath {
    CommonStyleTwoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CommonStyleTwoCellIdentifier forIndexPath:indexPath];
    //[CommonStyleTwoCell ]
    return cell;
}
@end
