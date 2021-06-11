//
//  WatchComModel.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WatchComModel : NSObject

@property (nonatomic, copy) NSMutableArray *array; // ComTrue

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, copy) NSString *objectId;

@end

NS_ASSUME_NONNULL_END
