//
//  CommitLikeCombineView.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CommitLikeCombineViewDelegate <NSObject>

- (void)jumpCommitVC;

@end

@interface CommitLikeCombineView : UIView

@property (nonatomic, weak)id<CommitLikeCombineViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
