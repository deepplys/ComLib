//
//  FocusInfoDataSource.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/8.
//

#import "FocusInfoDataSource.h"
#import "CommonStyleThrCell.h"

static NSString * const CommonStyleThrCellIdentifier = @"CommonStyleThrCellIdentifier";

@implementation FocusInfoDataSource

- (void)updateInfos {
    NSLog(@"cxll");
}

- (void)registCollectionViewCells:(UICollectionView *)collectionView {
    [collectionView registerClass:[CommonStyleThrCell class]
       forCellWithReuseIdentifier:CommonStyleThrCellIdentifier];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 18;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self commonStyleThrCellInCollectionView:collectionView atIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        
    } else if (indexPath.row == 1) {
        
    } else {
        //[self.delegate push
    }
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = collectionView.frame.size.width;
    return [CommonStyleThrCell cellSizeWithWidth:width];
}

- (CommonStyleThrCell *)commonStyleThrCellInCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath {
    CommonStyleThrCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CommonStyleThrCellIdentifier forIndexPath:indexPath];
    return cell;
}

@end
