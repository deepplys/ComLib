//
//  RecommendViewModel.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/26.
//

#import "RecommendMainViewModel.h"
#import <BmobSDK/Bmob.h>
#import "ComTrue.h"

@implementation RecommendMainViewModel

- (void)updateModel {
    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"Component"];
    //查找Component表的数据
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        for (BmobObject *obj in array) {
        //打印playerName
            ComTrue *item = [[ComTrue alloc] init];
            item.base = [[ComBaseInfo alloc] init];
            item.base.comName = [obj objectForKey:@"C_ProName"];
            item.base.comIntro = [obj objectForKey:@"C_Intro"];
            item.ownerID = [obj objectForKey:@"C_OwnerID"];
            item.createdAt = [obj.createdAt description];
            [self.model.array addObject:item];
            NSLog(@"obj.C_ProName = %@", [obj objectForKey:@"C_ProName"]);
            //NSLog(@"obj.C_ProName = %@", [obj objectForKey:@"C_ProName"]);
            //NSLog(@"obj.C_ProName = %@", [obj objectForKey:@"C_ProName"]);
            //NSLog(@"obj.C_ProName = %@", [obj objectForKey:@"C_ProName"]);
            //打印objectId,createdAt,updatedAt
        }
        [self.delegate setNewStyle];
        [self.delegate endFresh];
        NSLog(@"complt");
    }];
    
}

- (RecommendModel *)model {
    if (!_model) {
        _model = [RecommendModel new];
    }
    return _model;
}
@end
