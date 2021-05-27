//
//  RecommendDataSources.h
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/8.
//

#import <Foundation/Foundation.h>
#import "RecommendModel.h"
#import <MJRefresh/MJRefresh.h>
#import "RecommendMainViewModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol RecommendDataSourcesDelegate <NSObject>

@required
- (void)didSelectItemInfo:(NSDictionary *)dict;

- (void)endRefresh;

@end

@interface RecommendDataSources : NSObject <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource , RecommendMainViewModelDelegate>

@property (nonatomic, weak) UICollectionView *collection;
@property (nonatomic, strong) RecommendModel *recommendModel;
@property (nonatomic, strong) RecommendMainViewModel *recommendViewModel;
@property (nonatomic, weak) id<RecommendDataSourcesDelegate> delegate;

//- (void)updateInfos:(NSMutableArray *)Infos;
- (void)registCollectionViewCells:(UICollectionView *)collectionView;

@end

NS_ASSUME_NONNULL_END
