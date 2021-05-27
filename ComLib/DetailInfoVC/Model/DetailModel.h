//
//  DetailModel.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/21.
//

#import <Foundation/Foundation.h>
#import "ComTrue.h"

/*
ComTrue
刻面            构件的内容
构件基本信息    构件名称    构件简介    构件版本
构件分类信息    构件领域    语言类型    构件功能简述
构件环境信息    运行环境    构件配置    构件依赖情况
构件质量信息    构件可复用次数    构件规范性    构件稳定性
构件功能信息    请求功能    提供功能    接口参数
 
实体地址为对应构件的网址
*/

NS_ASSUME_NONNULL_BEGIN

@interface DetailModel : NSObject

@property (nonatomic, strong)NSMutableArray *array; //ComTrue

@end

NS_ASSUME_NONNULL_END
