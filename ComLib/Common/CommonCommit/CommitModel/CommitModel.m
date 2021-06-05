//
//  CommitModel.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/31.
//

#import "CommitModel.h"


@implementation CommitItemModel

@end

@implementation CommitModel

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
    NSMutableDictionary *dict1 = [NSMutableDictionary new];
    NSNumber *number = [[NSNumber alloc]initWithInt:-1];
    for (id obj in self.array) {
        NSDictionary *dict = (NSDictionary *)obj;
        CommitItemModel *item = [[CommitItemModel alloc] init];
        item.groupId = [dict objectForKey:@"CommitGroup"];
        item.groupItemId = [dict objectForKey:@"CommitGroupPos"];
        item.commitName = [dict objectForKey:@"CommitName"];
        item.data = [dict objectForKey:@"CommitDetail"];
        NSString *str = ((NSDate *)[dict objectForKey:@"createdAt"]).description;
        item.commitTime = str;
        if (item.groupId.intValue > number.intValue) {
            number=[[NSNumber alloc]initWithInt:item.groupId.intValue];
        }
        if ([dict1 objectForKey:item.groupId]) {
            NSMutableArray *tempArray = (NSMutableArray *)[dict1 objectForKey:item.groupId];
            [tempArray addObject:item];
            [dict1 setValue:tempArray forKey:item.groupId];
        } else {
            NSMutableArray *tempArray = [NSMutableArray new];
            [tempArray addObject:item];
            [dict1 setValue:tempArray forKey:item.groupId];
        }
    }
    for (int i=0;i<=number.intValue;i++) {
        NSString *str = [[NSString alloc] initWithFormat:@"%d",i];
        if ([dict1 objectForKey:str]) {
            [self.array1 addObject:[dict1 objectForKey:str]];
        }
    }
}

@end
