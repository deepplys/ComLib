//
//  SearchResultDataSource.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/31.
//

#import <Foundation/Foundation.h>
#import <MJRefresh/MJRefresh.h>
#import "SearchResultModel.h"
#import "SearchResultViewModel.h"
#import "ComTrue.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SearchResultDataSourceDelegate <NSObject>

- (void)didSelectItemInfo:(ComTrue *)dict;
- (void)endFresh;

@end

@interface SearchResultDataSource : NSObject <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, SearchResultViewModelDelagate>

@property (nonatomic, weak) UICollectionView *collection;
@property (nonatomic, strong) SearchResultModel *Model;
@property (nonatomic, strong) SearchResultViewModel *viewModel;
@property (nonatomic, weak) id delegate;

- (void)updateInfos:(NSMutableArray *)Infos;
- (void)registCollectionViewCells:(UICollectionView *)collectionView;

@end

NS_ASSUME_NONNULL_END
