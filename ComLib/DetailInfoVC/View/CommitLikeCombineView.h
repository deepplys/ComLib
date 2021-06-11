//
//  CommitLikeCombineView.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^CommitLikeCombineBlock)(void);

@protocol CommitLikeCombineViewDelegate <NSObject>

- (void)jumpCommitVC;

@end


@interface CommitLikeCombineView : UIView

@property (nonatomic, weak)id<CommitLikeCombineViewDelegate> delegate;
@property (nonatomic, copy)CommitLikeCombineBlock block;
@property (nonatomic, copy)NSString *proObjectId;
@property (nonatomic, copy)NSString *isLike;
@property (nonatomic, copy)NSString *isAdd;

@end

NS_ASSUME_NONNULL_END
