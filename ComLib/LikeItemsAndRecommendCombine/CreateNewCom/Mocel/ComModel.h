//
//  ComModel.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/22.
//

#import <Foundation/Foundation.h>
#import "ComModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ComModel : NSObject

@property(nonatomic,strong)NSMutableArray * arrray;//数组中元素的个数为cell的行数

@property(nonatomic,strong)NSMutableArray * tmparrray;//存cell

@property(nonatomic,strong)NSMutableArray * tmpIndexPath;//存indexPath

@property(nonatomic,strong)NSMutableArray * tmparrayaaaaa;//获取cell的数据

@end

NS_ASSUME_NONNULL_END
