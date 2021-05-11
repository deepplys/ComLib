//
//  RecommendModel.h
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface RecommendModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *detailText;
@property (nonatomic, copy) NSArray *imgUrls;
@property (nonatomic, copy) NSString *jumpText;

@end

NS_ASSUME_NONNULL_END
