//
//  UserInfosEditView.h
//  ComLib
//
//  Created by 崔祥龙 on 2021/3/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol UserInfosEditViewDelegate <NSObject>

- (void)closeEditVC;
- (void)openAlert;

@end

@interface UserInfosEditView : UIView

@property (nonatomic, weak) id<UserInfosEditViewDelegate> delegate;
@property (nonatomic, strong) UIImageView *avtarImageView;
@property (nonatomic, strong) UITextField *nameField;
@property (nonatomic, strong) UITextField *detailField;

@end

NS_ASSUME_NONNULL_END
