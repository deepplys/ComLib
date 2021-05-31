//
//  WatchComViewModel.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/30.
//

#import "WatchComViewModel.h"
#import <BmobSDK/Bmob.h>
#import "ComTrue.h"
#import "NSUserNameStatus.h"

@implementation WatchComViewModel


- (void)updateModelWithName:(NSString *)name {
    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"Component"];
    [bquery whereKey:@"C_OwnerID" equalTo:name];
    //查找Component表的数据
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        for (BmobObject *obj in array) {
        //打印playerName
            ComTrue *item = [[ComTrue alloc] init];
            item.base = [[ComBaseInfo alloc] init];
            item.enviro = [[ComEnviroInfo alloc] init];
            item.type = [[ComTypeInfo alloc] init];
            item.stars = [[ComStarsInfo alloc] init];
            item.use = [[ComUseInfo alloc] init];
            item.base.comName = [obj objectForKey:@"C_ProName"];
            item.base.comIntro = [obj objectForKey:@"C_Intro"];
            item.base.comVersion = [obj objectForKey:@"C_Version"];
            item.enviro.comRelay = [obj objectForKey:@"C_Relay"] ; //
            item.enviro.comSet = [obj objectForKey:@"C_Set"] ; //
            item.enviro.comRunEnvio= [obj objectForKey:@"C_RunType"] ;//
            item.type.comCover = [obj objectForKey:@"C_Cover"]; //
            item.type.comLaugu = [obj objectForKey:@"C_CodeType"]; //
            item.type.comUseIntro = [obj objectForKey:@"C_Use"]; //
            item.stars.comStable = [obj objectForKey:@"C_Stable"]; //
            item.stars.comWarning = [obj objectForKey:@"C_Warnig"]; //
            item.stars.comUseTime = [obj objectForKey:@"C_UseTime"]; //
            item.use.comPots = [obj objectForKey:@"C_Pots"]; //
            item.use.comSupplyUse = [obj objectForKey:@"C_SupplyUse"]; //
            item.use.comRequseUse = [obj objectForKey:@"C_RequstUse"]; //
            item.like = [obj objectForKey:@"C_Like"]; //
            item.ownerID = [obj objectForKey:@"C_OwnerID"]; //
            item.createdAt = [obj.createdAt description]; //
            item.commit = [obj objectForKey:@"C_Viewed"]; //
            item.url = [obj objectForKey:@"C_Detail"]; //
            [self.model.array addObject:item];
            NSLog(@"obj.C_ProName = %@", [obj objectForKey:@"C_ProName"]);
            //NSLog(@"obj.C_ProName = %@", [obj objectForKey:@"C_ProName"]);
            //NSLog(@"obj.C_ProName = %@", [obj objectForKey:@"C_ProName"]);
            //NSLog(@"obj.C_ProName = %@", [obj objectForKey:@"C_ProName"]);
            //打印objectId,createdAt,updatedAt
        }
        [self.delegate endFresh];
        NSLog(@"complt");
    }];
    
}

- (WatchComModel *)model {
    if (!_model) {
        _model = [WatchComModel new];
    }
    return _model;
}

@end
