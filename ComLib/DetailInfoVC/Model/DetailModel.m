//
//  DetailModel.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/21.
//

#import "DetailModel.h"

@implementation DetailModel


- (NSMutableArray *)array {
    if (!_array) {
        _array = [NSMutableArray new];
    }
    return _array;
}
@end
