//
//  LikeItemsModel.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/9.
//

#import "LikeItemsModel.h"

@implementation LikeItemModel


@end

@implementation LikeItemsModel

- (NSMutableArray *)array {
    if (!_array) {
        _array = [[NSMutableArray alloc] init];
    }
    return _array;
}

- (NSMutableArray *)array1 {
    if (!_array1) {
        _array1 = [[NSMutableArray alloc] init];
    }
    return _array1;
}



- (void)configModel {
    for (id obj in self.array) {
        NSDictionary *dict = (NSDictionary *)obj;
        NSDictionary *obj1 = [dict objectForKey:@"LikeComInfo"];
        ComTrue *item = [[ComTrue alloc] init];
        item.base = [[ComBaseInfo alloc] init];
        item.enviro = [[ComEnviroInfo alloc] init];
        item.type = [[ComTypeInfo alloc] init];
        item.stars = [[ComStarsInfo alloc] init];
        item.use = [[ComUseInfo alloc] init];
        item.base.comName = [obj1 objectForKey:@"C_ProName"];
        item.base.comIntro = [obj1 objectForKey:@"C_Intro"];
        item.base.comVersion = [obj1 objectForKey:@"C_Version"];
        item.enviro.comRelay = [obj1 objectForKey:@"C_Relay"] ; //
        item.enviro.comSet = [obj1 objectForKey:@"C_Set"] ; //
        item.enviro.comRunEnvio= [obj1 objectForKey:@"C_RunType"] ;//
        item.type.comCover = [obj1 objectForKey:@"C_Cover"]; //
        item.type.comLaugu = [obj1 objectForKey:@"C_CodeType"]; //
        item.type.comUseIntro = [obj1 objectForKey:@"C_Use"]; //
        item.stars.comStable = [obj1 objectForKey:@"C_Stable"]; //
        item.stars.comWarning = [obj1 objectForKey:@"C_Warnig"]; //
        item.stars.comUseTime = [obj1 objectForKey:@"C_UseTime"]; //
        item.use.comPots = [obj1 objectForKey:@"C_Pots"]; //
        item.use.comSupplyUse = [obj1 objectForKey:@"C_SupplyUse"]; //
        item.use.comRequseUse = [obj1 objectForKey:@"C_RequstUse"]; //
        item.like = [obj1 objectForKey:@"C_Like"]; //
        item.ownerID = [obj1 objectForKey:@"C_OwnerID"]; //
        item.createdAt = [[(NSDate *)[obj1 objectForKey:@"createdAt"] description] substringToIndex:19];
        item.commit = [obj1 objectForKey:@"C_Viewed"];
        item.url = [obj1 objectForKey:@"C_Detail"];
        item.objectId = [obj1 objectForKey:@"objectId"];
        [self.array1 addObject:item];
    }
}

@end
