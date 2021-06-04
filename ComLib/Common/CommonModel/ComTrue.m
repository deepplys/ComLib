//
//  ComTrue.m
//  ComLib
//
//  Created by cuixianglong on 2021/5/24.
//

#import "ComTrue.h"

@implementation ComBaseInfo

@end

@implementation ComTypeInfo

@end

@implementation ComEnviroInfo

@end

@implementation ComStarsInfo

@end

@implementation ComUseInfo

@end


@implementation ComTrue

- (NSComparisonResult)compareComTrue: (ComTrue *)com {
    NSComparisonResult result = [[NSNumber numberWithInt:com.commit.intValue* 10 + com.like.intValue] compare:[NSNumber numberWithInt:self.commit.intValue* 10 + self.like.intValue]];
    NSLog(@"cxl  sort   begin to end");
    return  result;
}

@end
