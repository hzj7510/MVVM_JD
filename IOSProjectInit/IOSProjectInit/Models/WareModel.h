//
//  WareModel.h
//  IOSProjectInit
//
//  Created by mac on 17/3/30.
//  Copyright © 2017年 x5. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BookRecommendinfo,Basicinfo,Service,BookCouponinfo,Abtest,Apppromotion,Videoinfo,Yanbaoinfo,Opinfo,Bookinfo,BookAd,Readinfo,Ebayinfo,Wareimage,Other,Shopinfo,Shop,Customerservice,BookRankinfo;

@interface WareModel : NSObject
@property (nonatomic, strong) BookRecommendinfo *recommendInfo;

@property (nonatomic, strong) Basicinfo *basicInfo;

@property (nonatomic, strong) Other *other;

@property (nonatomic, strong) Shopinfo *shopInfo;

@property (nonatomic, strong) BookRankinfo *rankInfo;

@end
@interface BookRecommendinfo : NSObject

@property (nonatomic, copy) NSString *recommendList;

@end

@interface Basicinfo : NSObject

@property (nonatomic, strong) Abtest *abTest;

@property (nonatomic, assign) BOOL downPrice;

@property (nonatomic, strong) Videoinfo *videoInfo;

@property (nonatomic, strong) NSArray<Wareimage *> *wareImage;

@property (nonatomic, copy) NSString *isShadowSku;

@property (nonatomic, copy) NSString *wareId;

@property (nonatomic, copy) NSString *ebook;

@property (nonatomic, copy) NSString *accessoryList;

@property (nonatomic, copy) NSString *chatUrl;

@property (nonatomic, strong) Apppromotion *appPromotion;

@property (nonatomic, copy) NSString *cartImage;

@property (nonatomic, copy) NSString *category;

@property (nonatomic, copy) NSString *shareUrl;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *shopIndex;

@property (nonatomic, strong) Yanbaoinfo *yanBaoInfo;

@property (nonatomic, assign) BOOL isOP;

@property (nonatomic, strong) BookCouponinfo *couponInfo;

@property (nonatomic, strong) Ebayinfo *ebayinfo;

@property (nonatomic, strong) Service *service;

@property (nonatomic, strong) Readinfo *readInfo;

@property (nonatomic, strong) Opinfo *OPInfo;

@property (nonatomic, copy) NSString *isOPImage;

@property (nonatomic, copy) NSString *venderId;

@property (nonatomic, strong) Bookinfo *bookInfo;

@property (nonatomic, strong) BookAd *ad;

@property (nonatomic, assign) BOOL gift;

@property (nonatomic, assign) BOOL isPop;

@end

@interface Service : NSObject

@property (nonatomic, copy) NSString *serviceIconUrl;

@property (nonatomic, copy) NSString *shortService;

@property (nonatomic, copy) NSString *service;

@property (nonatomic, assign) BOOL isPostByJd;

@end

@interface BookCouponinfo : NSObject

@property (nonatomic, strong) NSArray<NSString *> *couponList;

@property (nonatomic, copy) NSString *url;

@end

@interface Abtest : NSObject

@property (nonatomic, assign) NSInteger colorSizeABTest;

@property (nonatomic, assign) NSInteger suitABTest;

@end

@interface Apppromotion : NSObject

@property (nonatomic, copy) NSString *url;

@property (nonatomic, assign) BOOL isOpen;

@end

@interface Videoinfo : NSObject

@end

@interface Yanbaoinfo : NSObject

@end

@interface Opinfo : NSObject

@end

@interface Bookinfo : NSObject

@property (nonatomic, assign) BOOL display;

@property (nonatomic, copy) NSString *author;

@property (nonatomic, copy) NSString *publisher;

@end

@interface BookAd : NSObject

@end

@interface Readinfo : NSObject

@property (nonatomic, assign) BOOL isTryRead;

@property (nonatomic, copy) NSString *tryReadUrl;

@end

@interface Ebayinfo : NSObject

@property (nonatomic, assign) BOOL isEbay;

@end

@interface Wareimage : NSObject

@property (nonatomic, copy) NSString *share;

@property (nonatomic, copy) NSString *big;

@property (nonatomic, copy) NSString *small;

@end

@interface Other : NSObject

@property (nonatomic, assign) NSInteger supportSizeType;

@end

@interface Shopinfo : NSObject

@property (nonatomic, strong) Shop *shop;

@property (nonatomic, strong) Customerservice *customerService;

@end

@interface Shop : NSObject

@property (nonatomic, assign) NSInteger promotionNum;

@property (nonatomic, assign) NSInteger newNum;

@property (nonatomic, assign) NSInteger followCount;

@property (nonatomic, copy) NSString *brief;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, assign) BOOL hasCoupon;

@property (nonatomic, copy) NSString *venderType;

@property (nonatomic, copy) NSString *logo;

@property (nonatomic, assign) BOOL diamond;

@property (nonatomic, assign) NSInteger totalNum;

@property (nonatomic, assign) NSInteger shopId;

@property (nonatomic, assign) NSInteger shopActivityTotalNum;

@property (nonatomic, assign) CGFloat score;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign)CGFloat wareScore;

@property (nonatomic, assign)CGFloat efficiencyScore;

@property (nonatomic, assign)CGFloat serviceScore;

@end

@interface Customerservice : NSObject

@property (nonatomic, assign) BOOL hasChat;

@property (nonatomic, copy) NSString *mLink;

@property (nonatomic, assign) BOOL online;

@property (nonatomic, assign) BOOL hasJimi;

@end

@interface BookRankinfo : NSObject

@end
