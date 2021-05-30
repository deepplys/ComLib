//
//  WatchComModel.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/12.
//

#import "WatchComModel.h"

@implementation WatchComModel

- (NSMutableArray *)array {
    if (!_array) {
        _array = [NSMutableArray new];
    }
    return _array;
}

@end
