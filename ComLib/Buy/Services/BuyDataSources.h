//
//  BuyDataSources.h
//  ComLib
//
//  Created by 崔祥龙 on 2021/3/19.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BuyModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BuyDataSources : NSObject <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *collection;
@property (nonatomic, copy) NSString *canShow;
@property (nonatomic, strong) BuyModel *buy;
@property (nonatomic, weak) id delegate;

- (void)updateInfos:(NSMutableArray *)Infos;
- (void)registTabViewCells:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
