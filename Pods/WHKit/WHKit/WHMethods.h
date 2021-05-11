//
//  WHMethods.h
//  WHKit
//  https://github.com/remember17/WHKit
//  Created by 吴浩 on 2017/6/7.
//  Copyright © 2017年 remember17. All rights reserved.
//  

#import <UIKit/UIKit.h>

@interface WHMethods : UIViewController

/** 更改iOS状态栏的颜色 */
+ (void)wh_setStatusBarBackgroundColor:(UIColor *)color;

/** 为控制器添加背景图片 */
+ (void)wh_addBackgroundImageWithImageName:(NSString *)imageName forViewController:(UIViewController *)viewController;

/** 获取数组中的最大值 */
+ (CGFloat) wh_maxNumberFromArray:(NSArray *)array;

/** 获取数组中的最小值 */
+ (CGFloat) wh_minNumberFromArray:(NSArray *)array;

/** 获取数组的和 */
+ (CGFloat) wh_sumNumberFromArray:(NSArray *)array;

/** 获取数组平均值 */
+ (CGFloat) wh_averageNumberFromArray:(NSArray *)array;

/** 可用硬件容量 */
+ (CGFloat) wh_usableHardDriveCapacity;

/** 硬件总容量 */
+ (CGFloat) wh_allHardDriveCapacity;

@end
