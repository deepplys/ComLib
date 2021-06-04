//
//  DetailInfoHeaderVIew.h
//  ComLib
//
//  Created by cuixianglong on 2021/5/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailInfoHeaderVIew : UIView

@property (nonatomic, strong)UIImageView *icon;
@property (nonatomic, strong)UILabel *name;
@property (nonatomic, strong)UILabel *time;
@property (nonatomic, strong)UILabel *status;
@property (nonatomic, strong)UILabel *title;
@property (nonatomic, strong)UILabel *info;
@property (nonatomic, strong)UIButton *like;
@property (nonatomic, strong)UILabel *commit;

@end

NS_ASSUME_NONNULL_END
