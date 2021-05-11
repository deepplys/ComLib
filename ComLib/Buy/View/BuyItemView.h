//
//  BuyItemView.h
//  ComLib
//
//  Created by cuixianglong on 2021/4/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BuyItemViewDelegate <NSObject>

- (void)displayVC;

@end

@interface BuyItemView : UIView

@property (nonatomic, strong)id<BuyItemViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
