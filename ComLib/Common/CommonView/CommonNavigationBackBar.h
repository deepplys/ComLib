//
//  CommonNavigationBackBar.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CommonNavigationBackBarDelegate <NSObject>

- (void)backToVC;

@end

@interface CommonNavigationBackBar : UIView

@property (nonatomic, weak)id<CommonNavigationBackBarDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
