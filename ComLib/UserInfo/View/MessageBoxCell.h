//
//  MessageBoxCell.h
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MessageBoxCell : UICollectionViewCell

@property (nonatomic, copy)NSString *topText;
@property (nonatomic, copy)NSString *detailText;
@property (nonatomic, copy)NSString *imgUrl;

+ (CGSize)cellSizeWithWidth:(CGFloat)width;

- (void)updateWithTopText:(NSString *)topText withDetailText:(NSString *)detailText;

@end

NS_ASSUME_NONNULL_END
