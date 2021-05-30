//
//  WatchComViewModel.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/30.
//

#import <Foundation/Foundation.h>
#import "WatchComModel.h"
NS_ASSUME_NONNULL_BEGIN

@protocol WatchComViewModelDelagate <NSObject>

- (void)endFresh;

@end

@interface WatchComViewModel : NSObject

@property (nonatomic, strong)WatchComModel *model;
@property (nonatomic, weak)id<WatchComViewModelDelagate> delegate;
- (void)updateModelWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
