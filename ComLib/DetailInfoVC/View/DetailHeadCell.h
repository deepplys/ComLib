//
//  DetailHeadCell.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/15.
//

#import <UIKit/UIKit.h>
#import "ComTrue.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailHeadCell : UICollectionViewCell

- (void)configWithModel:(ComTrue *)item;

+ (CGSize)cellSizeWithWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
