//
//  UserInfosModel.h
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface MessageBoxModel : NSObject

@property (nonatomic, copy)NSString *topText;
@property (nonatomic, copy)NSString *detailText;

@end

@interface UserModel : NSObject

@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *detail;
@property (nonatomic, copy)NSString *loginID;

@end

@interface UserInfosModel : NSObject

@property (nonatomic, copy)NSArray<MessageBoxModel *> *box;
@property (nonatomic, strong)UserModel *user;

@end

@interface UserInfosResponse : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *detail;

@end

NS_ASSUME_NONNULL_END
