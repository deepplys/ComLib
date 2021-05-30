//
//  SearchBarView.h
//  ComLib
//
//  Created by cuixianglong on 2021/4/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SearchBarViewDelegate <NSObject>

- (void)jumpSearchVC;

@end

@interface SearchBarView : UIView

@property (nonatomic, weak)id<SearchBarViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
