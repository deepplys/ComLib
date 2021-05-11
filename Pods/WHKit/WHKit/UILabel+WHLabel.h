//
//  UILabel+WHLabel.h
//  WHKit
//  https://github.com/remember17/WHKit
//  Created by 吴浩 on 2017/6/7.
//  Copyright © 2017年 remember17. All rights reserved.
//  

#import <UIKit/UIKit.h>

@interface UILabel (WHLabel)

/** 快速创建Label */
+(instancetype)wh_labelWithText:(NSString *)text textFont:(int)font textColor:(UIColor *)color frame:(CGRect)frame;

/** 设置字间距 */
- (void)setColumnSpace:(CGFloat)columnSpace;

/** 设置行距 */
- (void)setRowSpace:(CGFloat)rowSpace;

@end
