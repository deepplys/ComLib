//
//  DerailInfoVC.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/3.
//

#import <UIKit/UIKit.h>
#import "DetailInfoDataSources.h"
#import "ComTrue.h"

NS_ASSUME_NONNULL_BEGIN

@interface DerailInfoVC : UIViewController

@property (nonatomic, strong) DetailInfoDataSources *dataSources;
- (instancetype)initWithData:(ComTrue *)dict;

@end

NS_ASSUME_NONNULL_END
