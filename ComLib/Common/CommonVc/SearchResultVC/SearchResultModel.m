//
//  SearchResultModel.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/31.
//

#import "SearchResultModel.h"

@implementation SearchResultModel

- (NSMutableArray *)array {
    if (!_array) {
        _array = [NSMutableArray new];
    }
    return _array;
}

@end
