//
//  UserInfoDataSource.h
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/9.
//

#import <Foundation/Foundation.h>
#import <UIKit/UICollectionViewFlowLayout.h>
#import <UIKit/UICollectionView.h>
#import "UserInfosModel.h"
#import "HeadCell.h"
#import "UserInfoViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface UserInfoDataSource : NSObject <UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,HeadCellDelegate>

@property (nonatomic, weak) UICollectionView *collection;
@property (nonatomic, strong) UserInfosModel *userInfosModel;
@property (nonatomic, weak) id<HeadCellDelegate> delegate;
@property (nonatomic, strong) NSString *isLogin;
@property (nonatomic, strong) UserInfoViewModel *viewmodel;

- (void)updateInfos;
- (void)registCollectionViewCells:(UICollectionView *)collectionView;

@end

NS_ASSUME_NONNULL_END
