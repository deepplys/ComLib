//
//  WatchComVC.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/12.
//

#import <UIKit/UIKit.h>


/*
 创建该VC时先传入对应的name，根据name进行网络请求
 */
NS_ASSUME_NONNULL_BEGIN

@interface WatchComVC : UIViewController

@property(nonatomic,assign)NSInteger page;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, copy) NSString *objectId;

@end

NS_ASSUME_NONNULL_END
