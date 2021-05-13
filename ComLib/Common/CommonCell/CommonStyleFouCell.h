//
//  CommonStyleFouCell.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommonStyleFouCell : UICollectionViewCell

@property (nonatomic, strong)UILabel *detail;
@property (nonatomic, strong)NSNumber *num;

+ (CGSize)cellSizeWithWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
