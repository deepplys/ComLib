//
//  CommonStyleThrCell.h
//  ComLib
//
//  Created by 崔祥龙 on 2021/3/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CommonStyleThrCellDelegate <NSObject>

- (void)jumpDetailVC;

@end

@interface CommonStyleThrCell : UICollectionViewCell

@property (nonatomic, weak) id delegate;
@property (nonatomic, copy) NSString *objectId;

- (void)configWithModel:(NSDictionary *)dict;

+ (CGSize)cellSizeWithWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
