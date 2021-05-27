//
//  DetailInfoDataSources.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/12.
//

#import <Foundation/Foundation.h>
#import "DetailModel.h"
#import <MJRefresh/MJRefresh.h>
NS_ASSUME_NONNULL_BEGIN
@protocol DetailInfoDataSourcesDelegate <NSObject>

@required

- (void)didSelectItemInfo:(NSDictionary *)dict;

@end

@interface DetailInfoDataSources : NSObject <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (nonatomic, weak) UICollectionView *collection;
@property (nonatomic, strong) DetailModel *recommendModel;
@property (nonatomic, weak) id<DetailInfoDataSourcesDelegate> delegate;

- (void)updateInfos:(NSMutableArray *)Infos;
- (void)registCollectionViewCells:(UICollectionView *)collectionView;

@end

NS_ASSUME_NONNULL_END
