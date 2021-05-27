//
//  ComDatasour.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UICollectionViewFlowLayout.h>
#import <UIKit/UICollectionView.h>
#import "ComViewModel.h"
#import "enterButCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ComDatasour : NSObject <UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,enterButCellDelegate>

@property (nonatomic, weak) UICollectionView *collection;
@property (nonatomic, copy) NSString *canShow;
@property (nonatomic, strong) ComViewModel *viewModel;
@property (nonatomic, weak) id delegate;

- (void)updateInfos:(NSMutableArray *)Infos;
- (void)registCollectionViewCells:(UICollectionView *)collectionView;

@end
NS_ASSUME_NONNULL_END
