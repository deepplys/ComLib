//
//  DetailViewModel.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/24.
//

#import "DetailViewModel.h"
/*
@property (nonatomic, strong)ComBaseInfo *base;
@property (nonatomic, strong)ComTypeInfo *type;
@property (nonatomic, strong)ComEnviroInfo *enviro;
@property (nonatomic, strong)ComStarsInfo *stars;
@property (nonatomic, strong)ComUseInfo *use;
@property (nonatomic, copy)NSString *url;
@property (nonatomic, copy)NSNumber *like;
@property (nonatomic, copy)NSString *commit;
*/
@implementation DetailViewModel

- (void)configData {
    ComTrue *a = [ComTrue new];
    a.base.comName = @"com";
    a.base.comIntro = @"com";
    a.base.comVersion = @"com";
    a.type.comCover = @"com";
    a.type.comLaugu = @"com";
    a.type.comUseIntro = @"com";
    a.enviro.comSet = @"com";
    a.enviro.comRelay= @"com";
    a.enviro.comRunEnvio = @"com";
    a.stars.comUseTime = @"com";
    a.stars.comWarning = @"com";
    a.stars.comStable = @"com";
    a.url = @"";
    a.like = @(0);
    a.commit = @"";
}

- (DetailModel *)model {
    if (!_model) {
        _model = [DetailModel new];
    }
    return _model;
}

@end
