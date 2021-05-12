//
//  FocusInfoDataSource.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/8.
//

#import <Foundation/Foundation.h>
#import <UIKit/UICollectionViewFlowLayout.h>
#import <UIKit/UICollectionView.h>
#import "FocusModel.h"
#import "HeadCell.h"
#import "UserInfoViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FocusInfoDataSource : NSObject <UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic, weak) UICollectionView *collection;
@property (nonatomic, strong) FocusModel *focusModel;
@property (nonatomic, weak) id delegate;

- (void)updateInfos;
- (void)registCollectionViewCells:(UICollectionView *)collectionView;

@end

NS_ASSUME_NONNULL_END
