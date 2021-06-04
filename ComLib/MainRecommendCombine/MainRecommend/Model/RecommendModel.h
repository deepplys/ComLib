//
//  RecommendModel.h
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/8.
//

#import <UIKit/UIKit.h>
#import "ComTrue.h"

NS_ASSUME_NONNULL_BEGIN


@interface RecommendModel : NSObject

@property (nonatomic, copy) NSMutableArray *array; // ComTrue

@property (nonatomic, copy) NSMutableArray *likeArray;

- (void)sortArray1;

@end

NS_ASSUME_NONNULL_END
