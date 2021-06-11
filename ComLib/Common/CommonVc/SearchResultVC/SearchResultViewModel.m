//
//  SearchResultViewModel.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/31.
//

#import "SearchResultViewModel.h"
#import <BmobSDK/Bmob.h>
#import "ComTrue.h"
#import "NSUserNameStatus.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "NSObject+Hint.h"

@implementation SearchResultViewModel

- (void)updateModelWithName:(NSString *)name {
    NSString *regex = [[NSString alloc] initWithFormat:@"(?i)(%@)",name ];
    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"Component"];
    [bquery whereKey:@"C_OwnerID" matchesWithRegex:regex];
    
    BmobQuery   *bquery1 = [BmobQuery queryWithClassName:@"Component"];
    [bquery1 whereKey:@"C_ProName" matchesWithRegex:regex];
    
    BmobQuery   *bquery2 = [BmobQuery queryWithClassName:@"Component"];
    [bquery2 whereKey:@"C_Intro" matchesWithRegex:regex];
    
    BmobQuery   *bquery3 = [BmobQuery queryWithClassName:@"Component"];
    [bquery3 whereKey:@"C_CodeType" matchesWithRegex:regex];
    
    BmobQuery   *main = [BmobQuery queryWithClassName:@"Component"];
    [main add:bquery];
    [main add:bquery1];
    [main add:bquery2];
    [main add:bquery3];
    [main orOperation];
    
    //查找Component表的数据
    [main findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
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
        if (self.model.array.count == 0) {
            [self showSuccessWithMsg:@"搜索结果为空"];
        }
        [self.delegate endFresh];
        NSLog(@"complt");
    }];
    
}


/*
 @property (nonatomic, strong)UITextField *pronameTF;
 @property (nonatomic, strong)UITextField *CodeTypeTF;
 @property (nonatomic, strong)UITextField *UseTypeTF;
 @property (nonatomic, strong)UITextField *RunTypeTF;
 */
- (void)updateModelWithDict:(NSDictionary *)dict {
    NSString *name = [dict objectForKey:@"pronameTF"];
    NSString *codeType = [dict objectForKey:@"CodeTypeTF"];
    NSString *RunType = [dict objectForKey:@"RunTypeTF"];
    NSString *UseType = [dict objectForKey:@"UseTypeTF"];
    NSString *regex = [[NSString alloc] initWithFormat:@"(?i)(%@)",name ];
    NSString *regex1 = [[NSString alloc] initWithFormat:@"(?i)(%@)",codeType ];
    NSString *regex2 = [[NSString alloc] initWithFormat:@"(?i)(%@)",RunType ];
    NSString *regex3 = [[NSString alloc] initWithFormat:@"(?i)(%@)",UseType ];
    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"Component"];
    [bquery whereKey:@"C_ProName" matchesWithRegex:regex];
    
    BmobQuery   *bquery1 = [BmobQuery queryWithClassName:@"Component"];
    [bquery1 whereKey:@"C_CodeType" matchesWithRegex:regex1];
    
    BmobQuery   *bquery2 = [BmobQuery queryWithClassName:@"Component"];
    [bquery2 whereKey:@"C_RunType" matchesWithRegex:regex2];
    
    BmobQuery   *bquery3 = [BmobQuery queryWithClassName:@"Component"];
    [bquery3 whereKey:@"C_UseType" matchesWithRegex:regex3];
    
    BmobQuery   *main = [BmobQuery queryWithClassName:@"Component"];
    [main add:bquery];
    [main add:bquery1];
    [main add:bquery2];
    [main add:bquery3];
    [main andOperation];
    
    //查找Component表的数据
    [main findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
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
        if (self.model.array.count == 0) {
            [self showSuccessWithMsg:@"搜索结果为空"];
        }
        [self.delegate endFresh];
        NSLog(@"complt");
    }];
    
}

- (SearchResultModel *)model {
    if (!_model) {
        _model = [SearchResultModel new];
    }
    return _model;
}


@end
