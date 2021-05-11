//
//  HeadCell.h
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/9.
//

#import <UIKit/UIKit.h>
#import "UserInfosModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol HeadCellDelegate <NSObject>

- (void)dispalyEditView;
- (void)jumpLogin;

@end

@interface HeadCell : UICollectionViewCell

@property (nonatomic, assign) BOOL login;
@property (nonatomic, weak) id<HeadCellDelegate> delegate;

- (void)updataInfoWithModel:(UserInfosModel *)model;
+ (CGSize)cellSizeWithWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
