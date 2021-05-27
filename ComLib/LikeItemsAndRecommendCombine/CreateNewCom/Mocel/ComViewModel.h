//
//  ComViewModel.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/22.
//

#import <Foundation/Foundation.h>
#import "ComModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ComViewModel : NSObject

@property (nonatomic, strong)ComModel *model;

- (void)setInfo;

@end

NS_ASSUME_NONNULL_END
