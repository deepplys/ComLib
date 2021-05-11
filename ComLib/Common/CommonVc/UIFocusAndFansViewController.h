//
//  UIFocusAndFansViewController.h
//  ComLib
//
//  Created by 崔祥龙 on 2021/3/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol UIFocusAndFansViewControllerDelegate <NSObject>

- (void)backVC;

@end

@interface UIFocusAndFansViewController : UIViewController

@property (nonatomic, assign)BOOL isShow;
@property (nonatomic, weak)id<UIFocusAndFansViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
