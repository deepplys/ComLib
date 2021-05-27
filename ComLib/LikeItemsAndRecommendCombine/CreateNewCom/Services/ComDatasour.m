//
//  ComDatasour.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/22.
//

#import "ComDatasour.h"
#import "ComCell.h"
#import "enterButCell.h"

static NSString * const ComCellIdentifier = @"ComCellIdentifier";
static NSString * const enterButCellIdentifier = @"enterButCellIdentifier";

@implementation ComDatasour

- (void)updateInfos:(NSMutableArray *)Infos {
    
}

- (void)registCollectionViewCells:(UICollectionView *)collectionView {
    [collectionView registerClass:[ComCell class]
       forCellWithReuseIdentifier:ComCellIdentifier];
    [collectionView registerClass:[enterButCell class] forCellWithReuseIdentifier:enterButCellIdentifier];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.viewModel.model.arrray.count + 1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.viewModel.model.arrray.count ) {
        UICollectionViewCell *cell = [self enterButCellInInCollectionView:collectionView atIndexPath:indexPath];
        //[self.viewModel.model.tmpIndexPath addObject:indexPath];
        //[self.viewModel.model.tmparrray addObject:cell];
        return cell;
    } else {
        UICollectionViewCell *cell = [self ComCellInCollectionView:collectionView atIndexPath:indexPath];
        [self.viewModel.model.tmpIndexPath addObject:indexPath];
        [self.viewModel.model.tmparrray addObject:cell];
        return cell;
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = (collectionView.frame.size.width);
    return [ComCell cellSizeWithWidth:width];
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 4.f, 12.f, 4);
}

- (ComCell *)ComCellInCollectionView:(UICollectionView *)collectionView
                                   atIndexPath:(NSIndexPath *)indexPath {
    ComCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ComCellIdentifier forIndexPath:indexPath];
    //[LikeItemCell updateInfoWithModel];
    [cell setInfo:self.viewModel.model.arrray[indexPath.row]];
    return cell;
}

- (void)save {
    for(int i = 0; i<self.viewModel.model.arrray.count; i++)
    {
        [self.viewModel.model.tmparrayaaaaa removeObject:[NSString stringWithFormat:@"%id",i]];
        if ([[self.collection cellForItemAtIndexPath:[self.viewModel.model.tmpIndexPath objectAtIndex:i]] isKindOfClass:[ComCell class]]) {
            ComCell *cell= (ComCell *)[self.collection cellForItemAtIndexPath:[self.viewModel.model.tmpIndexPath objectAtIndex:i]];
            [self.viewModel.model.tmparrayaaaaa addObject:cell.RunTypeTF.text];
            for (int i = 0; i < ((self.viewModel.model.arrray.count * (self.viewModel.model.arrray.count +1)) /2 ) - self.viewModel.model.arrray.count; i++)
            {
                [self.viewModel.model.tmparrayaaaaa removeObjectAtIndex:0];
            }
            NSLog(@"======获取cell的值====>%@",self.viewModel.model.tmparrayaaaaa);
        } else {
            NSLog(@"error !!");
        }
    }
}

- (enterButCell *)enterButCellInInCollectionView:(UICollectionView *)collectionView
                                                 atIndexPath:(NSIndexPath *)indexPath {
    enterButCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:enterButCellIdentifier forIndexPath:indexPath];
    //[CommonStyleTwoCell ]
    cell.delegate = self;
    return cell;
}


- (ComViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[ComViewModel alloc] init];
        [_viewModel setInfo];
    }
    return _viewModel;
}

@end
