//
//  UserLoginVC.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/11.
//

#import <UIKit/UIKit.h>
#import "NSObject+Hint.h"

NS_ASSUME_NONNULL_BEGIN
@protocol UserLoginVCDelegate <NSObject>

- (void)backToVC;
- (void)updateModel:(NSString *)loginId;

@end

@interface UserLoginVC : UIViewController

@property (nonatomic, weak)id<UserLoginVCDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
