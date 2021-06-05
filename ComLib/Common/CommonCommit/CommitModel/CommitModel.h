//
//  CommitModel.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface CommitItemModel : NSObject

@property (nonatomic, copy) NSString *groupId;
@property (nonatomic, copy) NSString *groupItemId;
@property (nonatomic, copy) NSString *data;
@property (nonatomic, copy) NSString *commitName;
@property (nonatomic, copy) NSString *commitTime;

@end

@interface CommitModel : NSObject

@property (nonatomic, strong)NSMutableArray *array;
@property (nonatomic, strong)NSMutableArray *array1;
@property (nonatomic, copy) NSString *objectId;

- (void)configModel;

@end

NS_ASSUME_NONNULL_END
