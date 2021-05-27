//
//  enterButCell.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol enterButCellDelegate <NSObject>

- (void)save;

@end

@interface enterButCell : UICollectionViewCell

@property (nonatomic, weak)id<enterButCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
