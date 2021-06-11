//
//  LikeItemViewModel.m
//  ComLib
//
//  Created by cuixianglong on 2021/6/6.
//

#import "LikeItemViewModel.h"

@implementation LikeItemViewModel

- (void)updateModelWithTabId:(NSString *) str {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:str forKey:@"objectId"];
    [BmobCloud callFunctionInBackground:@"addLikeComForUser" withParameters:dict block:^(id object, NSError *error) {
        if (error) {
            NSString *errorDetail = error.description;
            [SVProgressHUD showErrorWithStatus:errorDetail];
        } else {
            NSLog(@"%@",object);
            
            self.model.array = [NSString stringToJson:object];
            [self.model.array1 removeAllObjects];
            [self.model configModel];
            //self.model.array = [NSString stringToJson:object];
            //[self.tableView reloadData];
            [self.delegate endFrs];
            //[self.tableView.mj_header endRefreshing];
        }
    }];
}

- (LikeItemsModel *)model {
    if (!_model) {
        _model = [[LikeItemsModel alloc] init];
    }
    return _model;
}

@end
