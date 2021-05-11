//
//  BuyCell.h
//  ComLib
//
//  Created by 崔祥龙 on 2021/3/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BuyCell : UITableViewCell

@property (nonatomic, copy)NSString *topText;
@property (nonatomic, copy)NSString *detailText;
@property (nonatomic, copy)NSString *imgUrl;

+ (CGSize)cellSizeWithWidth:(CGFloat)width;
- (void)updateInfoWithModel;

@end

NS_ASSUME_NONNULL_END
