//
//  SubTabCell.h
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SubTabCellDeledate <NSObject>

- (void)jumpDownload;

@end

@interface SubTabCell : UICollectionViewCell

@property (nonatomic, weak) id<SubTabCellDeledate> delegate;

+ (CGSize)cellSizeWithWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
