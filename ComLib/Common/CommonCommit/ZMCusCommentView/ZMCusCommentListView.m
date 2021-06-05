//
//  ZMCusCommentListView.m
//  ZM
//
//  Created by Kennith.Zeng on 2018/8/29.
//  Copyright © 2018年 Kennith. All rights reserved.
//

#import "ZMCusCommentListView.h"
#import "ZMCusCommentListTableHeaderView.h"
#import "ZMCusCommentListContentCell.h"
#import "ZMCusCommentListReplyContentCell.h"
#import "ZMColorDefine.h"
#import "CommitModel.h"


@interface ZMCusCommentListView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) ZMCusCommentListTableHeaderView *headerView;
@property (nonatomic, assign) BOOL isSelect;

@end


@implementation ZMCusCommentListView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if ([super initWithFrame:frame]) {
        self.backgroundColor = RGBHexColor(0xffffff, 1);
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 15;
        [self layoutUI];
        
    }
    return self;
}
- (void)layoutUI{
    
    @weakify(self)
    _headerView = [[ZMCusCommentListTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 70)];
    _headerView.closeBtnBlock = ^{
        @strongify(self)
        if (self.closeBtnBlock) {
            self.closeBtnBlock();
        }
    };
    [self addSubview:_headerView];

    CGFloat tableHeight  = SCREEN_HEIGHT - CGRectGetHeight(self.headerView.frame) - SAFE_AREA_BOTTOM - ZMCusComentBottomViewHeight-STATUS_AND_NAV_BAR_HEIGHT;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.headerView.frame), SCREEN_WIDTH, tableHeight) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.showsHorizontalScrollIndicator=NO;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.tableFooterView = [UIView new];
    _tableView.estimatedRowHeight = 10000;
    [_tableView registerClass:[ZMCusCommentListContentCell class] forCellReuseIdentifier:NSStringFromClass([ZMCusCommentListContentCell class])];
    [_tableView registerClass:[ZMCusCommentListReplyContentCell class] forCellReuseIdentifier:NSStringFromClass([ZMCusCommentListReplyContentCell class])];
    [self addSubview:_tableView];

    CGFloat toolViewY = SCREEN_HEIGHT-ZMCusComentBottomViewHeight-SAFE_AREA_BOTTOM-STATUS_AND_NAV_BAR_HEIGHT;
    _toolView = [[ZMCusCommentToolView alloc] initWithFrame:CGRectMake(0, toolViewY, SCREEN_WIDTH, ZMCusComentBottomViewHeight+STATUS_BAR_HEIGHT)];
    _toolView.sendBtnBlock = ^(NSString *text){
        @strongify(self)
        if (self.sendBtnBlock) {
            self.sendBtnBlock(text);
        }
    };
    [self addSubview:_toolView];

}

- (void)setComObjId:(NSString *)comObjId {
    _comObjId = comObjId;
    [self.viewModel updateModelWithObjectId:comObjId];
}

- (CommitViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[CommitViewModel alloc] init];
    }
    return _viewModel;
}


#pragma mark UITableViewDataSource, UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.viewModel.model.array1.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSMutableArray *array = [self.viewModel.model.array1 objectAtIndex:section];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //如果你需要做成多级回复的话，可以改一下tableview为section 的形式去做
    if (indexPath.row != 0) {
        ZMCusCommentListReplyContentCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZMCusCommentListReplyContentCell class]) forIndexPath:indexPath];
        [cell configData:[self modelAtIndexPath:indexPath]];
        return cell;
    }else{
        ZMCusCommentListContentCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZMCusCommentListContentCell class]) forIndexPath:indexPath];
        [cell configData:[self modelAtIndexPath:indexPath]];
        return cell;
    }

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewAutomaticDimension;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    //防止重复点击
    if (!self.isSelect) {
        self.isSelect = YES;
        [self performSelector:@selector(repeatDelay) withObject:nil afterDelay:1.0f];
        CommitItemModel *item = [self modelAtIndexPath:indexPath];
        NSString *str = [[NSString alloc] initWithFormat:@"回复：%@", item.commitName];
        self.toolView.textView.placeholder = str;
        [self.toolView showTextView];
        self.isReply = @"1";
        if (self.replyBtnBlock) {
            self.replyBtnBlock();
        }
    }
}

- (void)repeatDelay{
    self.isSelect = NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //self.isReply = @"0";
    [self.toolView hideTextView];
}

- (CommitItemModel *)modelAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray *array = [self.viewModel.model.array1 objectAtIndex:indexPath.section];
    if ([[array objectAtIndex:indexPath.row] isKindOfClass:[CommitItemModel class]]) {
        CommitItemModel *model = [array objectAtIndex:indexPath.row];
        return model;
    } else {
        return nil;
    }
}


@end
