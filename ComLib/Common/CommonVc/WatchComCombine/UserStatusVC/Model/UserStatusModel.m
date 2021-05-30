//
//  UserStatusModel.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/30.
//

#import "UserStatusModel.h"

@implementation UserStatusModel

- (NSMutableArray *)array {
    if (!_array) {
        _array = [NSMutableArray new];
    }
    return _array;
}

@end
