//
//  RecommendViewModel.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/26.
//

#import <Foundation/Foundation.h>
#import "RecommendModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol RecommendMainViewModelDelegate <NSObject>

- (void)setNewStyle;
- (void)endFresh;

@end

@interface RecommendMainViewModel : NSObject

@property (nonatomic, strong)RecommendModel *model;
@property (nonatomic, weak)id<RecommendMainViewModelDelegate> delegate;

- (void)updateModel;
- (void)updateModelWithTabId:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
