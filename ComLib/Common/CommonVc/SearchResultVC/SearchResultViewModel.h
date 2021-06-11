//
//  SearchResultViewModel.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/31.
//

#import <Foundation/Foundation.h>
#import "SearchResultModel.h"
NS_ASSUME_NONNULL_BEGIN

@protocol SearchResultViewModelDelagate <NSObject>

- (void)endFresh;

@end


@interface SearchResultViewModel : NSObject

@property (nonatomic, strong)SearchResultModel *model;
@property (nonatomic, weak)id<SearchResultViewModelDelagate> delegate;
- (void)updateModelWithName:(NSString *)name;
- (void)updateModelWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
