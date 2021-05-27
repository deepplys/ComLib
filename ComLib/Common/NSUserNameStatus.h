//
//  NSUserNameStatus.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSUserNameStatus : NSObject

+ (void)saveName:(NSString *)name;

+ (NSString *)getForName;

@end

NS_ASSUME_NONNULL_END
