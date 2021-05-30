//
//  ComTypeCell.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/24.
//

#import <UIKit/UIKit.h>
#import "ComTrue.h"

NS_ASSUME_NONNULL_BEGIN

@interface ComTypeCell : UICollectionViewCell

+ (CGSize)cellSizeWithWidth:(CGFloat)width;

+ (CGSize)cellSizeWithWidth:(CGFloat)width
                   withType:(NSString *)type
                  withModel:(ComTrue *)dict;
- (void)updateDataWithType:(NSString *)type
                  withModel:(ComTrue *)dict;
@end

NS_ASSUME_NONNULL_END
