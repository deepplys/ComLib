//
//  UserLoginAndRegisterVC.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/11.
//

#import <UIKit/UIKit.h>
#import "NSObject+Hint.h"
NS_ASSUME_NONNULL_BEGIN

@protocol UserLoginAndRegisterVCDelegate <NSObject>

- (void)backToVC;

@end
@interface UserLoginAndRegisterVC : UIViewController
@property (nonatomic, weak)id<UserLoginAndRegisterVCDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
