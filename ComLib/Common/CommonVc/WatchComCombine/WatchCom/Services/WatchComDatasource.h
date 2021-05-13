//
//  WatchComDatasource.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/12.
//

#import <Foundation/Foundation.h>
#import <MJRefresh/MJRefresh.h>
#import "WatchComModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface WatchComDatasource : NSObject <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (nonatomic, weak) UICollectionView *collection;
@property (nonatomic, strong) WatchComModel *watchModel;
@property (nonatomic, weak) id delegate;

- (void)updateInfos:(NSMutableArray *)Infos;
- (void)registCollectionViewCells:(UICollectionView *)collectionView;

@end

NS_ASSUME_NONNULL_END
