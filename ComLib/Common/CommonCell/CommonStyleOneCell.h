//
//  CommonStyleOneCell.h
//  ComLib
//
//  Created by 崔祥龙 on 2021/3/30.
//

#import <UIKit/UIKit.h>
#import "ComTrue.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommonStyleOneCell : UICollectionViewCell

- (void)configWithCom:(ComTrue *)item;

+ (CGSize)cellSizeWithWidth:(CGFloat)width;

+ (CGSize)cellSizeWithWidth:(CGFloat)width withInfo:(NSString *)info;


@end

NS_ASSUME_NONNULL_END
