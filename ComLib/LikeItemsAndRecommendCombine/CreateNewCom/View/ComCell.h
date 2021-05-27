//
//  ComCell.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ComCell : UICollectionViewCell

@property (nonatomic, readonly)UITextField *RunTypeTF;
@property (nonatomic, copy)NSString *info;

+ (CGSize)cellSizeWithWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
