//
//  ProductRecommendModel.h
//  IOSProjectInit
//
//  Created by mac on 17/3/30.
//  Copyright © 2017年 x5. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Wareinfolist;
@interface ProductRecommendModel : NSObject
@property (nonatomic, copy) NSString *expid;

@property (nonatomic, strong) NSArray<Wareinfolist *> *wareInfoList;

@property (nonatomic, copy) NSString *code;
@end
@interface Wareinfolist : NSObject

@property (nonatomic, copy) NSString *clickUrl;

@property (nonatomic, assign) NSInteger itemType;

@property (nonatomic, copy) NSString *canAddCart;

@property (nonatomic, copy) NSString *reqsig;

@property (nonatomic, copy) NSString *abt;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *wareId;

@property (nonatomic, copy) NSString *canFreeRead;

@property (nonatomic, copy) NSString *imageurl;

@property (nonatomic, assign) BOOL isPlusWare;

@property (nonatomic, copy) NSString *good;

@property (nonatomic, assign) NSInteger endRemainTime;

@property (nonatomic, copy) NSString *adword;

@property (nonatomic, copy) NSString *similarEnter;

@property (nonatomic, copy) NSString *sid;

@property (nonatomic, assign) BOOL isDotScheme;

@property (nonatomic, copy) NSString *wname;

@property (nonatomic, assign) NSInteger couponSortType;

@property (nonatomic, copy) NSString *promotion;

@property (nonatomic, copy) NSString *jdPrice;

@property (nonatomic, copy) NSString *commentCount;

@property (nonatomic, assign) BOOL jdShop;

@property (nonatomic, copy) NSString *sourceValue;

@property (nonatomic, assign) BOOL isSamWare;

@property (nonatomic, copy) NSString *followCount;

@property (nonatomic, copy) NSString *canNegFeedback;

@property (nonatomic, copy) NSString *book;

@property (nonatomic, assign) NSInteger startRemainTime;

@property (nonatomic, assign) NSInteger stockStateId;

@property (nonatomic, assign) NSInteger remainNum;

@end

