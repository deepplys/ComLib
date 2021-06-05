//
//  ZMCusCommentView.h
//  ZM
//
//  Created by Kennith.Zeng on 2018/8/29.
//  Copyright © 2018年 Kennith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZMCusCommentListView.h"

@interface ZMCusCommentView : UIView

@property (nonatomic, copy) NSString *comObjId;
@property (nonatomic, copy) NSString *authorObjId;
@property (nonatomic, strong) ZMCusCommentListView *commentListView;

@end

@interface ZMCusCommentManager : NSObject
+ (instancetype)shareManager;
- (void)showCommentWithComObjId:(NSString *)comObjId WithAuthorID:(NSString *)authorId;
@end
