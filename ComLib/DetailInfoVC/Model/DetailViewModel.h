//
//  DetailViewModel.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/24.
//

#import <Foundation/Foundation.h>
#import "DetailModel.h"
#import "ComTrue.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewModel : NSObject

@property (nonatomic, strong)DetailModel *model;

- (void)configData;


@end

NS_ASSUME_NONNULL_END
