//
//  LikeItemDataSources.h
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/9.
//

#import <Foundation/Foundation.h>
#import <UIKit/UICollectionViewFlowLayout.h>
#import <UIKit/UICollectionView.h>
#import "LikeItemViewModel.h"
#import "ComTrue.h"

NS_ASSUME_NONNULL_BEGIN

@protocol LikeItemDataSourcesDelegate <NSObject>

- (void)didSelectItemInfo:(ComTrue *)dict;

@end

@interface LikeItemDataSources : NSObject <UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) UICollectionView *collection;
@property (nonatomic, copy) NSString *canShow;
@property (nonatomic, strong) LikeItemViewModel *viewModel;
@property (nonatomic, weak) id<LikeItemDataSourcesDelegate> delegate;

- (void)updateInfos:(NSMutableArray *)Infos;
- (void)registCollectionViewCells:(UICollectionView *)collectionView;

@end

NS_ASSUME_NONNULL_END
