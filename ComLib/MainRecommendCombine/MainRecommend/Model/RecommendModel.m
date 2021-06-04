//
//  RecommendModel.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/8.
//

#import "RecommendModel.h"
#import <YYKit/YYKit.h>

@implementation RecommendModel

- (NSMutableArray *)array {
    if (!_array) {
        _array = [NSMutableArray new];
    }
    return _array;
}

- (NSMutableArray *)likeArray {
    if (!_likeArray) {
        _likeArray = [NSMutableArray new];
    }
    return _likeArray;
}

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"name" : @"n",
             @"page" : @"p",
             @"desc" : @"ext.desc",
             @"bookID" : @[@"id",@"ID",@"book_id"]};
}


- (void)sortArray1 {
    NSMutableArray *array = self.array;
    [array sortUsingSelector:@selector(compareComTrue:)];
    self.array = array;
}

@end
