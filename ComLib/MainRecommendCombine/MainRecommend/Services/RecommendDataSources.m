//
//  RecommendDataSources.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/8.
//

#import "RecommendDataSources.h"
#import "RecommendCell.h"
#import "RecommenHeadCell.h"
#import "CommonStyleOneCell.h"

static NSString * const RecommendCellIdentifier = @"RecommendCellIdentifier";
static NSString * const RecommenHeadCellIdentifier = @"RecommenHeadCellIdentifier";
static NSString * const CommonStyleOneCellIdentifier = @"CommonStyleOneCellIdentifier";

@implementation RecommendDataSources

- (void)setNewStyle {
    NSLog(@"setNewStyle");
    //[self.collection reloadData];
}

- (void)endFresh {
    [self.delegate endRefresh];
}

- (void)registCollectionViewCells:(UICollectionView *)collectionView {
    [collectionView registerClass:[RecommendCell class]
       forCellWithReuseIdentifier:RecommendCellIdentifier];
    [collectionView registerClass:[RecommenHeadCell class]
       forCellWithReuseIdentifier:RecommenHeadCellIdentifier];
    [collectionView registerClass:[CommonStyleOneCell class] forCellWithReuseIdentifier:CommonStyleOneCellIdentifier];

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.recommendViewModel.model.array.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return [self recommendHeadCellInCollectionView:collectionView atIndexPath:indexPath];
    } else {
        return [self commonStyleOneCellInCollectionView:collectionView atIndexPath:indexPath];
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
        //return [CommonStyleOneCell cellSizeWithWidth:width];
        return [CommonStyleOneCell cellSizeWithWidth:width withInfo:[self comTrueInArray:indexPath].base.comIntro];
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
    ComTrue *item = [self comTrueInArray:indexPath];
    [cell configWithCom:item];
    return cell;
}

- (RecommendMainViewModel *)recommendViewModel {
    if (!_recommendViewModel) {
        _recommendViewModel = [RecommendMainViewModel new];
        _recommendViewModel.delegate = self;
    }
    return _recommendViewModel;
}

- (ComTrue *)comTrueInArray:(NSIndexPath *)indexPath {
    if ([self.recommendViewModel.model.array[indexPath.row] isKindOfClass:[ComTrue class]]) {
        return (ComTrue *)self.recommendViewModel.model.array[indexPath.row];
    } else {
        return nil;
    }
}

@end
