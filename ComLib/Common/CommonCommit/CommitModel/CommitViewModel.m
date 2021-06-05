//
//  CommitViewModel.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/31.
//

#import "CommitViewModel.h"
#import <BmobSDK/Bmob.h>
#import "ComTrue.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import <YYKit/YYKit.h>
#import "NSString+check.h"

@implementation CommitViewModel

- (void)updateModelWithObjectId:(NSString *) str {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:str forKey:@"objectId"];
    [BmobCloud callFunctionInBackground:@"CommitVal" withParameters:dict block:^(id object, NSError *error) {
        if (error) {
            NSString *errorDetail = error.description;
            [SVProgressHUD showErrorWithStatus:errorDetail];
        } else {
            NSLog(@"%@",object);
            self.model.array = [NSString stringToJson:object];
            [self.model configModel];
            [self.delegate endFsh];
        }
    }];
}

- (CommitModel *)model {
    if (!_model) {
        _model = [[CommitModel alloc] init];
    }
    return _model;
}

@end
