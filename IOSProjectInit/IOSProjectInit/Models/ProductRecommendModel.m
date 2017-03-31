
//
//  ProductRecommendModel.m
//  IOSProjectInit
//
//  Created by mac on 17/3/30.
//  Copyright © 2017年 x5. All rights reserved.
//

#import "ProductRecommendModel.h"

@implementation ProductRecommendModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

}

+ (NSDictionary *)objectClassInArray{
    return @{@"wareInfoList" : [Wareinfolist class]};
}
@end
@implementation Wareinfolist
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end


