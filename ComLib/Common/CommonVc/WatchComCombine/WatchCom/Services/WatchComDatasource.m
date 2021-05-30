//
//  WatchComDatasource.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/12.
//

#import "WatchComDatasource.h"
#import "WatchHeadCell.h"
#import "CommonStyleTwoCell.h"
#import "ComTrue.h"
#import "DerailInfoVC.h"

static NSString * const CommonStyleTwoCellIdentifier = @"CommonStyleTwoCellIdentifier";

@implementation WatchComDatasource

- (void)updateInfos:(NSMutableArray *)Infos {

}

- (void)registCollectionViewCells:(UICollectionView *)collectionView {
    [collectionView registerClass:[CommonStyleTwoCell class]
       forCellWithReuseIdentifier:CommonStyleTwoCellIdentifier];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.viewModel.model.array.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self CommonStyleTwoCellInCollectionView:collectionView atIndexPath:indexPath];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = collectionView.frame.size.width;
    return [CommonStyleTwoCell cellSizeWithWidth:width withInfo:[self comTrueInArray:indexPath].base.comIntro];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate didSelectItemInfo:[self comTrueInArray:indexPath]];
}

- (CommonStyleTwoCell *)CommonStyleTwoCellInCollectionView:(UICollectionView *)collectionView
                                     atIndexPath:(NSIndexPath *)indexPath {
    CommonStyleTwoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CommonStyleTwoCellIdentifier forIndexPath:indexPath];
    [cell updataWithModel:[self comTrueInArray:indexPath]];
    return cell;
}

- (ComTrue *)comTrueInArray:(NSIndexPath *)indexPath {
    if ([self.viewModel.model.array[indexPath.row] isKindOfClass:[ComTrue class]]) {
        return (ComTrue *)self.viewModel.model.array[indexPath.row];
    } else {
        return nil;
    }
}

- (WatchComViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[WatchComViewModel alloc] init];
    }
    return _viewModel;
}


@end
