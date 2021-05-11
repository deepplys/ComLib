//
//  NSObject+Hint.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/11.
//

#import "NSObject+Hint.h"
#import <MBProgressHUD/MBProgressHUD.h>
#define kToastDuration 1

@implementation NSObject (Hint)

- (void)showLoad {
    [MBProgressHUD showHUDAddedTo:[self currentView] animated:YES];
}
- (void)hideLoad {
    [MBProgressHUD hideAllHUDsForView:[self currentView] animated:YES];
}

- (void)showSuccessWithMsg:(NSObject *)msg {
    [self hideLoad];
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[self currentView] animated:YES];
    progressHUD.mode = MBProgressHUDModeText;
    progressHUD.labelText = msg.description;
    [progressHUD hide:YES afterDelay:kToastDuration];
}
- (void)showErrorWithMsg:(NSObject *)msg {
    [self hideLoad];
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[self currentView] animated:YES];
    progressHUD.mode = MBProgressHUDModeText;
    progressHUD.labelText = msg.description;
    [progressHUD hide:YES afterDelay:kToastDuration];
}

- (UIView *)currentView{
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    if ([vc isKindOfClass:[UITabBarController class]]) {
        vc = [(UITabBarController *)vc selectedViewController];
    }
    if([vc isKindOfClass:[UINavigationController class]]) {
        vc = [(UINavigationController *)vc visibleViewController]; //当前显示的控制器
    }
    if (!vc) {
        return [UIApplication sharedApplication].keyWindow;
    }
    return vc.view;
}

@end
