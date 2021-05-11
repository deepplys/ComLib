//
//  NSObject+Hint.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/11.
//

#import <Foundation/Foundation.h>

@interface NSObject (Hint)

/** 显示加载 */
- (void)showLoad;
/** 加载完毕 */
- (void)hideLoad;

/** 显示成功（及提示文字） */
- (void)showSuccessWithMsg:(NSObject *)msg;
/** 显示错误（及提示文字） */
- (void)showErrorWithMsg:(NSObject *)msg;

@end
