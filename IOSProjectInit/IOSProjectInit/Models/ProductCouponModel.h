//
//  ProductCouponModel.h
//  IOSProjectInit
//
//  Created by mac on 17/3/28.
//  Copyright © 2017年 x5. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Couponinfo;
@interface ProductCouponModel : NSObject

@property (nonatomic, strong) NSArray<Couponinfo *> *couponInfo;

@end

@interface Couponinfo : NSObject

@property (nonatomic, assign) NSInteger discount;

@property (nonatomic, copy) NSString *timeDesc;

@property (nonatomic, assign) NSInteger limitType;

@property (nonatomic, assign) NSInteger roleId;

@property (nonatomic, assign) NSInteger addDays;

@property (nonatomic, assign) NSInteger area;

@property (nonatomic, assign) NSInteger couponKind;

@property (nonatomic, assign) BOOL applicability;

@property (nonatomic, assign) NSInteger batchId;

@property (nonatomic, copy) NSString *endTime;

@property (nonatomic, copy) NSString *encryptedKey;

@property (nonatomic, assign) NSInteger userRiskLevel;

@property (nonatomic, assign) NSInteger couponType;

@property (nonatomic, copy) NSString *beginTime;

@property (nonatomic, assign) NSInteger quota;

@property (nonatomic, copy) NSString *name;

@end

