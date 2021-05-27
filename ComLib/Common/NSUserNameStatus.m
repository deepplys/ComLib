//
//  NSUserNameStatus.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/26.
//

#import "NSUserNameStatus.h"

@implementation NSUserNameStatus

+ (void)saveName:(NSString *)name {
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES)lastObject];
    // 拼接文件路径
    NSString *path = [doc stringByAppendingPathComponent:@"user.plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithObject:name forKey:@"username"];
    [dic writeToFile:path atomically:YES];
}

+ (NSString *)getForName {
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES) lastObject];
    NSString *path = [doc stringByAppendingPathComponent:@"user.plist"];
    // 读取数据
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    NSString *name = [dict objectForKey:@"username"];
    return name;
}

@end
