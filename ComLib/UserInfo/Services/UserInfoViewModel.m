//
//  UserInfoViewModel.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/3/18.
//

#import "UserInfoViewModel.h"

@implementation UserInfoViewModel

- (void)fetchAllUserInfo:(void(^)(NSString * _Nullable string1))compltaion {
    
    UserModel *user = [[UserModel alloc] init];
    user.name = @"中国飞人";
    user.detail = @"淡泊以明志，宁静以致远";
    self.obj2.user = user;
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    MessageBoxModel *model1 = [[MessageBoxModel alloc] init];
    model1.topText = @"收件箱";
    model1.detailText = @"查看消息";
    [arr addObject:model1];
    MessageBoxModel *model2 = [[MessageBoxModel alloc] init];
    model2.topText = @"你的奖励请注意查收";
    model2.detailText = @"2项奖励已解锁";
    [arr addObject:model2];
    self.obj2.box = [arr mutableCopy];
}

- (UserInfosModel *)obj2 {
    if (!_obj2) {
        _obj2 = [[UserInfosModel alloc] init];
    }
    return _obj2;
}
@end
