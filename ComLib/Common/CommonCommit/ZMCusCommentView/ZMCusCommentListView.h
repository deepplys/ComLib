//
//  ZMCusCommentListView.h
//  ZM
//
//  Created by Kennith.Zeng on 2018/8/29.
//  Copyright © 2018年 Kennith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZMCusCommentToolView.h"
#import "CommitViewModel.h"
#define ZMCusCommentViewTopHeight 101
#define ZMCusComentBottomViewHeight 55

@interface ZMCusCommentListView : UIView
@property (nonatomic, strong) ZMCusCommentToolView *toolView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSString *comObjId;
@property (nonatomic, strong) CommitViewModel *viewModel;
@property (nonatomic, copy) NSString *commitGroup;
@property (nonatomic, copy) NSString *isReply;
@property (nonatomic, copy) void(^sendBtnBlock)(NSString *text);
@property (nonatomic, copy) void(^closeBtnBlock)(void);
@property (nonatomic, copy) void(^replyBtnBlock)(void);
@end

