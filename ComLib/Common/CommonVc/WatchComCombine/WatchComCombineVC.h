//
//  WatchComCombineVC.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WatchComCombineVCDelegate <NSObject>

- (void)backVC;

@end

@interface WatchComCombineVC : UIViewController

@property (nonatomic, weak)id<WatchComCombineVCDelegate> delegate;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, copy) NSString *objectId;

- (void)configWithDict:(NSMutableDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
