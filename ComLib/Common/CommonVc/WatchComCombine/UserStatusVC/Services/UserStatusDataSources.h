//
//  UserStatusDataSources.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/30.
//

#import <Foundation/Foundation.h>
#import <MJRefresh/MJRefresh.h>
#import "UserStatusModel.h"
#import "UserStatusViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserStatusDataSources : NSObject

@property (nonatomic, weak) UICollectionView *collection;
@property (nonatomic, strong) UserStatusModel  *watchModel;
@property (nonatomic, strong) UserStatusViewModel *viewModel;
@property (nonatomic, weak) id delegate;

- (void)updateInfos:(NSMutableArray *)Infos;
- (void)registCollectionViewCells:(UICollectionView *)collectionView;

@end

NS_ASSUME_NONNULL_END
