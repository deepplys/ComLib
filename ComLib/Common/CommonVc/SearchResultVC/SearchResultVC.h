//
//  SearchResultVC.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchResultVC : UIViewController

@property(nonatomic, copy) NSString *name;
@property (nonatomic,copy) NSMutableDictionary *dict;
@property (nonatomic, copy) NSString *pos;

@end

NS_ASSUME_NONNULL_END
