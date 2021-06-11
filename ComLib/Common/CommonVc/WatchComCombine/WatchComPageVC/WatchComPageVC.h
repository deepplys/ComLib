//
//  WatchComPageVC.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/13.
//

#import "WMZPageController.h"

NS_ASSUME_NONNULL_BEGIN

@interface WatchComPageVC : WMZPageController

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, copy) NSString *objectId;
- (void)configStatus:(NSMutableDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
