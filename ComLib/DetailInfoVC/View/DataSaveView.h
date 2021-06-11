//
//  DataSaveView.h
//  ComLib
//
//  Created by cuixianglong on 2021/6/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DataSaveViewDelegate <NSObject>

- (void)saveData;

@end

@interface DataSaveView : UIView

@property (nonatomic , strong)UILabel *download;
@property (nonatomic , weak) id <DataSaveViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
