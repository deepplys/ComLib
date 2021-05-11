//
//  MyFoucusCell.h
//  ComLib
//
//  Created by 崔祥龙 on 2021/3/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MyFoucusCellDelegate <NSObject>

- (void)dispalyEditView;

@end

@interface MyFoucusCell : UICollectionViewCell

@property (nonatomic, weak) id<MyFoucusCellDelegate> delegate;

- (void)updataInfoWithModel:(NSObject *)model;
+ (CGSize)cellSizeWithWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
