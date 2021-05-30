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
#import "ComTypeCell.h"

static NSString * const RecommendCellIdentifier = @"RecommendCellIdentifier";
static NSString * const RecommenHeadCellIdentifier = @"RecommenHeadCellIdentifier";
static NSString * const CommonStyleOneCellIdentifier = @"CommonStyleOneCellIdentifier";
static NSString * const DetailHeadCellIdentifier = @"DetailHeadCellIdentifier";
static NSString * const ComTypeCellIdentifier = @"ComTypeCellIdentifier";

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
    [collectionView registerClass:[ComTypeCell class] forCellWithReuseIdentifier:ComTypeCellIdentifier];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return [self DetailHeadCellInCollectionView:collectionView atIndexPath:indexPath];
    } else {
        return [self ComTypeCellInCollectionView:collectionView atIndexPath:indexPath];
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
        NSString *str =[[NSString alloc] initWithFormat:@"%ld",indexPath.row - 1];
        return [ComTypeCell cellSizeWithWidth:width withType:str withModel:self.recommendModel.dict];
        //return [ComTypeCell cellSizeWithWidth:width];
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

- (ComTypeCell *)ComTypeCellInCollectionView:(UICollectionView *)collectionView
                                                        atIndexPath:(NSIndexPath *)indexPath {
    ComTypeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ComTypeCellIdentifier forIndexPath:indexPath];
    NSString *str =[[NSString alloc] initWithFormat:@"%ld",indexPath.row - 1];
    [cell updateDataWithType:str withModel:self.recommendModel.dict];
    return cell;
}

- (DetailModel *)recommendModel {
    if (!_recommendModel) {
        _recommendModel = [[DetailModel alloc] init];
    }
    return _recommendModel;
}

@end
