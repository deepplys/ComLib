//
//  UserInfosVC.h
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/8.
//

#import <UIKit/UIKit.h>
#import "UserInfoDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserInfosVC : UIViewController

@property (nonatomic, strong) UserInfoDataSource *dataSources;

@end

NS_ASSUME_NONNULL_END
