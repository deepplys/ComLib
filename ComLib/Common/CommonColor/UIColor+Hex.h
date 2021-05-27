//
//  UIColor+Hex.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define RGBA_COLOR(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]
#define RGB_COLOR(R,G,B) [UIColor colorWithRed:((R) / 255.0f) green: ((G) / 255.0f) blue:((B) / 255.0f) alpha: 1.0f]

#define ColorPrimaryText @"#303133"
#define ColorRegularText @"#606266"
#define ColorInfo @"#909399"
#define ColorSecondaryText @"#909399"
#define ColorSuccess @"#67C23A"
#define ColorWaning @"#E6A23C"


@interface UIColor (Hex)
  
// 从十六进制字符串获取颜色，
// color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
+ (UIColor *) colorWithHexString:(NSString *)color;


@end

NS_ASSUME_NONNULL_END
