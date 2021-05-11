//
//  UserInfoViewModel.h
//  ComLib
//
//  Created by 崔祥龙 on 2021/3/18.
//

#import <Foundation/Foundation.h>
#import "UserInfosModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface UserInfoViewModel : NSObject

@property (nonatomic, strong)UserInfosResponse *obj1;
@property (nonatomic, strong)UserInfosModel *obj2;

- (void)fetchAllUserInfo:(void(^)(NSString * _Nullable string1))compltaion;

@end

NS_ASSUME_NONNULL_END
