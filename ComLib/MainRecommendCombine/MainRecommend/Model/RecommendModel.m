//
//  RecommendModel.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/8.
//

#import "RecommendModel.h"

@implementation RecommendModel

- (NSMutableArray *)array {
    if (!_array) {
        _array = [NSMutableArray new];
    }
    return _array;
}

@end
