//
//  CommitViewModel.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/31.
//

#import <Foundation/Foundation.h>
#import "CommitModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CommitViewModelDelegate <NSObject>

- (void)endFsh;

@end
@interface CommitViewModel : NSObject

@property (nonatomic, weak) id <CommitViewModelDelegate> delegate;
@property (nonatomic, strong)CommitModel *model;

- (void)updateModelWithObjectId:(NSString *) str;

@end

NS_ASSUME_NONNULL_END
