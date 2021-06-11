//
//  DownloadServices.h
//  ComLib
//
//  Created by cuixianglong on 2021/6/11.
//

#import <Foundation/Foundation.h>
#import <Masonry/Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface DownloadServices : NSObject <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *collection;
@property (nonatomic, copy) NSString *canShow;
@property (nonatomic, weak) id delegate;
@property (nonatomic, strong) NSMutableArray *array;

- (void)updateInfos:(NSMutableArray *)Infos;
- (void)registTabViewCells:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
