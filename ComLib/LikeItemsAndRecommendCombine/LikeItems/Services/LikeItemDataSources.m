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
    return self.viewModel.model.array1.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self CommonStyleTwoCellInInCollectionView:collectionView atIndexPath:indexPath];
    //return [self LikeItemCellInCollectionView:collectionView atIndexPath:indexPath];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ComTrue *item = [self comTrueInArray:indexPath];
    if (item) {
        item.isAdd = YES;
    }
    [self.delegate didSelectItemInfo:[self comTrueInArray:indexPath]];
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
    [cell updataWithModel:[self comTrueInArray:indexPath]];
    //[CommonStyleTwoCell ]
    return cell;
}

- (ComTrue *)comTrueInArray:(NSIndexPath *)indexPath {
    if ([self.viewModel.model.array1[indexPath.row] isKindOfClass:[ComTrue class]]) {
        return (ComTrue *)self.viewModel.model.array1[indexPath.row];
    } else {
        return nil;
    }
}

- (LikeItemViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[LikeItemViewModel alloc] init];
        _viewModel.delegate = self.delegate;
    }
    return _viewModel;
}

@end
