//
//  NSCommitDefine.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/31.
//

#import <Foundation/Foundation.h>

#import "ZMColorDefine.h"
#import "Masonry.h"
#import "UIView+QJLayout.h"

// 定义这个常量，就可以不用在开发过程中使用"mas_"前缀。
#define MAS_SHORTHAND
// 定义这个常量，就可以让Masonry帮我们自动把基础数据类型的数据，自动装箱为对象类型。
#define MAS_SHORTHAND_GLOBALS
#import <Masonry.h>

#import <SVProgressHUD.h>

//屏幕的宽和高
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
//根据苹果6的宽获取响应的宽等比
#define DBWidthScale [UIScreen mainScreen].bounds.size.width/375
//根据苹果6的高获取响应的高等比
#define DBHeightScale [UIScreen mainScreen].bounds.size.height/667

//weakSelf
#define K_WeakSelf __weak __typeof(self) weakSelf = self
//Blcock 宏定义
#define K_BLOCK_EXEC(block,...) if(block){block(__VA_ARGS__);};


// 传入图片名称,获取UIImage
#define K_ImageNamed(_pointer) [UIImage imageNamed:_pointer]

//字体
#define K_UIFont(int) [UIFont systemFontOfSize:int];

#define T5   K_UIFont(14)
#define T9   K_UIFont(9)

//颜色
#define K_RGBCOLOR(r,g,b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define K_RGBACOLOR(r,g,b,a)  [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define C0    K_RGBCOLOR(255, 255, 255)
#define C1    K_RGBCOLOR(0, 0, 0)
#define C2    K_RGBCOLOR(237, 188, 56)
#define C6    K_RGBCOLOR(153, 153, 153)
#define C7    K_RGBCOLOR(221, 221, 221)


NS_ASSUME_NONNULL_BEGIN

@interface NSCommitDefine : NSObject

@end

NS_ASSUME_NONNULL_END
