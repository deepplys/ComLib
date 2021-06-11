//
//  LikeItemViewModel.h
//  ComLib
//
//  Created by cuixianglong on 2021/6/6.
//

#import <Foundation/Foundation.h>
#import "LikeItemsModel.h"
#import <BmobSDK/Bmob.h>
#import "ComTrue.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import <YYKit/YYKit.h>
#import "NSString+check.h"

NS_ASSUME_NONNULL_BEGIN

@protocol LikeItemViewModelDelegate <NSObject>

- (void)endFrs;

@end

@interface LikeItemViewModel : NSObject

@property (nonatomic, strong) LikeItemsModel *model;
@property (nonatomic, weak) id<LikeItemViewModelDelegate> delegate;

- (void)updateModelWithTabId:(NSString *) str;

@end

NS_ASSUME_NONNULL_END
