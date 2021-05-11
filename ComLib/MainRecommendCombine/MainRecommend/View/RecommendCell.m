//
//  RecommendCell.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/8.
//

#import "RecommendCell.h"

@interface RecommendCell ()

@end

@implementation RecommendCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = 2.f;
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    self.backgroundColor = [UIColor blueColor];
}

+ (CGSize)cellSizeWithWidth:(CGFloat)width {
    CGSize size = CGSizeMake(width, 100);
    return size;
}

@end
