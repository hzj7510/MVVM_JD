//
//  ProductCouponModel.m
//  IOSProjectInit
//
//  Created by mac on 17/3/28.
//  Copyright © 2017年 x5. All rights reserved.
//

#import "ProductCouponModel.h"

@implementation ProductCouponModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
+ (NSDictionary *)objectClassInArray{
    return @{@"couponInfo" : [Couponinfo class]};
}
@end
@implementation Couponinfo
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end


