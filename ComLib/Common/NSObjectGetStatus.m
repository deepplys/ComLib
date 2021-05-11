//
//  NSObjectGetStatus.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/3/15.
//

#import "NSObjectGetStatus.h"

@implementation NSObjectGetStatus

+ (CGFloat)statusBarH {
    CGFloat statusBarH = 0;
    if (@available(iOS 13.0, *)) {
        UIWindowScene *windowScene = (UIWindowScene *)[UIApplication sharedApplication].connectedScenes.allObjects.firstObject;
        statusBarH = windowScene.statusBarManager.statusBarFrame.size.height;
    } else {
        statusBarH = [[UIApplication sharedApplication] statusBarFrame].size.height;
    }
    return statusBarH;
}

+ (CGFloat)statusBarW {
    CGFloat statusBarW = 0;
    if (@available(iOS 13.0, *)) {
        UIWindowScene *windowScene = (UIWindowScene *)[UIApplication sharedApplication].connectedScenes.allObjects.firstObject;
        statusBarW = windowScene.statusBarManager.statusBarFrame.size.width;
    } else {
        statusBarW = [[UIApplication sharedApplication] statusBarFrame].size.width;
    }
    return statusBarW;
}

@end
