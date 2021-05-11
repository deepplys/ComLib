//
//  UserInfoDataSource.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/9.
//

#import "UserInfoDataSource.h"
#import "MessageBoxCell.h"
#import "SubTabCell.h"
#import "HeadCell.h"

static NSString * const MessageBoxCellIdentifier = @"MessageBoxCellIdentifier";
static NSString * const SubTabCellIdentifier = @"SubTabCellIdentifier";
static NSString * const HeadCellIdentifier = @"HeadCellIdentifier";

@implementation UserInfoDataSource

- (void)updateInfos {
    [self.viewmodel fetchAllUserInfo:^(NSString * _Nullable string1) {
        
    }];
    self.userInfosModel = self.viewmodel.obj2;
    NSLog(@"cxll");
}

- (void)registCollectionViewCells:(UICollectionView *)collectionView {
    [collectionView registerClass:[MessageBoxCell class]
       forCellWithReuseIdentifier:MessageBoxCellIdentifier];
    [collectionView registerClass:[SubTabCell class]
       forCellWithReuseIdentifier:SubTabCellIdentifier];
    [collectionView registerClass:[HeadCell class]
       forCellWithReuseIdentifier:HeadCellIdentifier];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return [self HeadCellInCollectionView:collectionView atIndexPath:indexPath];
    } else if (indexPath.row == 1) {
        return [self recommendHeadCellInCollectionView:collectionView atIndexPath:indexPath];
    } else {
        return [self MessageBoxCellInCollectionView:collectionView atIndexPath:indexPath];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        
    } else if (indexPath.row == 1) {
        
    } else {
        //[self.delegate push
    }
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = collectionView.frame.size.width;
    if (indexPath.row == 0) {
        return [HeadCell cellSizeWithWidth:width];
    } else if (indexPath.row == 1) {
        return [SubTabCell cellSizeWithWidth:width];
    } else {
        return [MessageBoxCell cellSizeWithWidth:width];
    }
}

- (HeadCell *)HeadCellInCollectionView:(UICollectionView *)collectionView
                                                        atIndexPath:(NSIndexPath *)indexPath {
    HeadCell *HeadCell = [collectionView dequeueReusableCellWithReuseIdentifier:HeadCellIdentifier forIndexPath:indexPath];
    [HeadCell updataInfoWithModel:self.userInfosModel];
    HeadCell.delegate = self;
    HeadCell.login = self.isLogin;
    return HeadCell;
}

- (void)dispalyEditView {
    if ([self.delegate respondsToSelector:@selector(dispalyEditView)]) {
        [self.delegate dispalyEditView];
    }
}

- (void)jumpLogin {
    [self.delegate jumpLogin];
}

- (MessageBoxCell *)MessageBoxCellInCollectionView:(UICollectionView *)collectionView
                                                        atIndexPath:(NSIndexPath *)indexPath {
    MessageBoxCell *MessageBoxCell = [collectionView dequeueReusableCellWithReuseIdentifier:MessageBoxCellIdentifier forIndexPath:indexPath];
    [MessageBoxCell updateWithTopText:self.userInfosModel.box[indexPath.row-2].topText withDetailText:self.userInfosModel.box[indexPath.row-2].detailText];
    return MessageBoxCell;
}

- (SubTabCell *)recommendHeadCellInCollectionView:(UICollectionView *)collectionView
                                                        atIndexPath:(NSIndexPath *)indexPath {
    SubTabCell *SubTabCell = [collectionView dequeueReusableCellWithReuseIdentifier:SubTabCellIdentifier forIndexPath:indexPath];
    //[SubTabCell updateUserActivityState: ];
    return SubTabCell;
}

- (UserInfoViewModel *)viewmodel {
    if (!_viewmodel) {
        _viewmodel = [[UserInfoViewModel alloc] init];
    }
    return _viewmodel;
}

@end
