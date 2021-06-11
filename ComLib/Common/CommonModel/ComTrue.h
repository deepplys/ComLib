//
//  ComTrue.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/24.
//

#import <Foundation/Foundation.h>

/*
刻面            构件的内容
构件基本信息    构件名称    构件简介    构件版本
构件分类信息    构件领域    语言类型    构件功能简述
构件环境信息    运行环境    构件配置    构件依赖情况
构件质量信息    构件可复用次数    构件规范性    构件稳定性
构件功能信息    请求功能    提供功能    接口参数
 
实体地址为对应构件的网址
*/

NS_ASSUME_NONNULL_BEGIN

@interface ComBaseInfo : NSObject

@property (nonatomic, copy)NSString *comName;
@property (nonatomic, copy)NSString *comIntro;
@property (nonatomic, copy)NSString *comVersion;

@end

@interface ComTypeInfo : NSObject

@property (nonatomic, copy)NSString *comCover;
@property (nonatomic, copy)NSString *comLaugu;
@property (nonatomic, copy)NSString *comUseIntro;

@end

@interface ComEnviroInfo : NSObject

@property (nonatomic, copy)NSString *comRunEnvio;
@property (nonatomic, copy)NSString *comSet;
@property (nonatomic, copy)NSString *comRelay;

@end

@interface ComStarsInfo : NSObject

@property (nonatomic, copy)NSString *comUseTime;
@property (nonatomic, copy)NSString *comWarning;
@property (nonatomic, copy)NSString *comStable;

@end

@interface ComUseInfo : NSObject

@property (nonatomic, copy)NSString *comRequseUse;
@property (nonatomic, copy)NSString *comSupplyUse;
@property (nonatomic, copy)NSString *comPots;

@end

@interface ComTrue : NSObject

@property (nonatomic, strong)ComBaseInfo *base;
@property (nonatomic, strong)ComTypeInfo *type;
@property (nonatomic, strong)ComEnviroInfo *enviro;
@property (nonatomic, strong)ComStarsInfo *stars;
@property (nonatomic, strong)ComUseInfo *use;
@property (nonatomic, copy)NSString *url;
@property (nonatomic, copy)NSNumber *like;
@property (nonatomic, copy)NSNumber *commit;
@property (nonatomic, copy)NSString *ownerID;
@property (nonatomic, copy)NSString *createdAt;
@property (nonatomic, copy)NSString *objectId;
@property (nonatomic, copy)NSString *ownerName;
@property (nonatomic, assign)BOOL isLike;
@property (nonatomic, assign)BOOL isAdd;

- (NSComparisonResult)compareComTrue: (ComTrue *)com;
@end

NS_ASSUME_NONNULL_END
