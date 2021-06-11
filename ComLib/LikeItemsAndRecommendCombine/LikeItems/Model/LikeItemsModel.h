//
//  LikeItemsModel.h
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/9.
//

#import <Foundation/Foundation.h>
#import "ComTrue.h"

NS_ASSUME_NONNULL_BEGIN

@interface  LikeItemModel: NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSString *imgUrl;

@end

@interface LikeItemsModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSString *imgUrl;

@property (nonatomic, copy) NSMutableArray *array;
@property (nonatomic, copy) NSMutableArray *array1;

- (void)configModel;

@end

NS_ASSUME_NONNULL_END
