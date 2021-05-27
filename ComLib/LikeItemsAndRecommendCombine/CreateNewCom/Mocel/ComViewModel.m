//
//  ComViewModel.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/22.
//

#import "ComViewModel.h"

/*
刻面            构件的内容
构件基本信息    构件名称    构件简介    构件版本
构件分类信息    构件领域    语言类型    构件功能简述
构件环境信息    运行环境    构件配置    构件依赖情况
构件质量信息    构件可复用次数    构件规范性    构件稳定性
构件功能信息    请求功能    提供功能    接口参数
 
实体地址为对应构件的网址
*/


@implementation ComViewModel

- (void)setInfo {
    _model = [ComModel new];

    [_model.arrray addObject:@"    请输入您的构件名称"];
    [_model.arrray addObject:@"    请输入您的构件简介"];
    [_model.arrray addObject:@"    请输入您的构件版本"];
    
    [_model.arrray addObject:@"    请输入您的构件领域"];
    [_model.arrray addObject:@"    请输入您的构件语言类型"];
    [_model.arrray addObject:@"    请输入您的构件功能简述"];
    
    [_model.arrray addObject:@"    请输入您的构件运行环境"];
    [_model.arrray addObject:@"    请输入您的构件配置"];
    [_model.arrray addObject:@"    请输入您的构件依赖情况"];
    
    [_model.arrray addObject:@"    请输入您的构件可复用次数"];
    [_model.arrray addObject:@"    请输入您的构件规范性"];
    [_model.arrray addObject:@"    请输入您的构件稳定性"];
    
    [_model.arrray addObject:@"    请输入您的构件请求功能"];
    [_model.arrray addObject:@"    请输入您的构件提供功能"];
    [_model.arrray addObject:@"    请输入您的构件接口参数"];
    
    [_model.arrray addObject:@"    请输入您的构件实体地址"];
}

@end
