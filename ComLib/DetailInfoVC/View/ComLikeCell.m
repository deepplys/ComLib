//
//  ComLikeCell.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/30.
//

#import "ComLikeCell.h"

@interface ComLikeCell ()

@property (nonatomic, strong)UILabel *createTime;
@property (nonatomic, strong)UILabel *like;

@end

@implementation ComLikeCell

+ (CGSize)cellSizeWithWidth:(CGFloat)width {
    CGSize size = CGSizeMake(width, 100);
    return size;
}



@end
