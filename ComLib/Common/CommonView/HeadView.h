//
//  HeadView.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HeadView : UIView

@property (nonatomic, copy) NSString *name1;
@property (nonatomic, copy) NSString *detail1;
@property (nonatomic, copy) NSString *objectId1;

- (void)updataWithDict:(NSMutableDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
