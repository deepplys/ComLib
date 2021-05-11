//
//  LikeItemDataSources.h
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/9.
//

#import <Foundation/Foundation.h>
#import <UIKit/UICollectionViewFlowLayout.h>
#import <UIKit/UICollectionView.h>
#import "LikeItemsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LikeItemDataSources : NSObject <UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) UICollectionView *collection;
@property (nonatomic, copy) NSString *canShow;
@property (nonatomic, strong) LikeItemsModel *likeItemsModel;
@property (nonatomic, weak) id delegate;

- (void)updateInfos:(NSMutableArray *)Infos;
- (void)registCollectionViewCells:(UICollectionView *)collectionView;

@end

NS_ASSUME_NONNULL_END
