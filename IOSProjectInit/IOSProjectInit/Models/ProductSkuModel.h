//
//  ProductSkuModel.h
//  IOSProjectInit
//
//  Created by mac on 17/3/30.
//  Copyright © 2017年 x5. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Wareinfo,Discount,Recommendinfo,Ad,Jprice,Xnzttips,Defaultaddr,Whitebarinfo,Planinfos,Pcprice,Cdn,Eventparam,Yuyueinfo,Flashinfo,Promotion,Gift,Activity,Suit,Productlist,Yushouinfo,Mprice,Rankinfo,Cutinfo,Warmtips,Iconlist;
@interface ProductSkuModel : NSObject

@property (nonatomic, strong) Wareinfo *wareInfo;

@property (nonatomic, copy) NSString *code;

@end

@interface Wareinfo : NSObject

@property (nonatomic, assign) BOOL cartFlag;

@property (nonatomic, strong) Cdn *cdn;

@property (nonatomic, assign) BOOL toABTest;

@property (nonatomic, strong) Cutinfo *cutInfo;

@property (nonatomic, strong) Jprice *jprice;

@property (nonatomic, strong) Eventparam *eventParam;

@property (nonatomic, copy) NSString *is7shortService;

@property (nonatomic, strong) Rankinfo *rankInfo;

@property (nonatomic, strong) NSArray<Warmtips *> *warmTips;

@property (nonatomic, assign) BOOL isPluginEnable;

@property (nonatomic, assign) BOOL easyBuy;

@property (nonatomic, strong) Mprice *mprice;

@property (nonatomic, assign) BOOL is7ToReturn;

@property (nonatomic, strong) Ad *ad;

@property (nonatomic, strong) Flashinfo *flashInfo;

@property (nonatomic, strong) Xnzttips *xnztTips;

@property (nonatomic, copy) NSString *accessoryList;

@property (nonatomic, copy) NSString *shopABTest;

@property (nonatomic, strong) NSArray<Iconlist *> *iconList;

@property (nonatomic, copy) NSString *priceLabel;

@property (nonatomic, copy) NSString *msTrailer;

@property (nonatomic, strong) Recommendinfo *recommendInfo;

@property (nonatomic, assign) NSInteger promiseShowNum;

@property (nonatomic, copy) NSString *originPrice;

@property (nonatomic, assign) BOOL isCollect;

@property (nonatomic, strong) Yushouinfo *YuShouInfo;

@property (nonatomic, strong) Promotion *promotion;

@property (nonatomic, strong) Yuyueinfo *yuyueInfo;

@property (nonatomic, assign) BOOL stockNotice;

@property (nonatomic, assign) NSInteger buyMaxNum;

@property (nonatomic, strong) Defaultaddr *defaultAddr;

@property (nonatomic, copy) NSString *fare;

@property (nonatomic, strong) Whitebarinfo *whiteBarInfo;

@property (nonatomic, copy) NSString *stock;

@property (nonatomic, copy) NSString *wareId;

@property (nonatomic, strong) Pcprice *pcPrice;

@property (nonatomic, strong) Discount *discount;

@property (nonatomic, copy) NSString *isXnzt;

@end

@interface Discount : NSObject

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, assign) BOOL display;

@property (nonatomic, copy) NSString *discount;

@end

@interface Recommendinfo : NSObject

@property (nonatomic, copy) NSString *recommendList;

@end

@interface Ad : NSObject

@property (nonatomic, copy) NSString *adLink;

@property (nonatomic, copy) NSString *adword;

@property (nonatomic, copy) NSString *adLinkContent;

@end

@interface Jprice : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *value;

@property (nonatomic, assign) BOOL display;

@end

@interface Xnzttips : NSObject

@end

@interface Defaultaddr : NSObject

@property (nonatomic, copy) NSString *cityId;

@property (nonatomic, copy) NSString *townId;

@property (nonatomic, copy) NSString *provinceId;

@property (nonatomic, copy) NSString *townName;

@property (nonatomic, copy) NSString *countyId;

@property (nonatomic, copy) NSString *provinceName;

@property (nonatomic, copy) NSString *cityName;

@property (nonatomic, copy) NSString *countyName;

@end

@interface Whitebarinfo : NSObject

@property (nonatomic, strong) NSArray<Planinfos *> *planInfos;

@property (nonatomic, assign) BOOL isLogin;

@property (nonatomic, assign) BOOL isBtUser;

@property (nonatomic, assign) BOOL isAva;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *marketingText;

@end

@interface Planinfos : NSObject

@property (nonatomic, copy) NSString *laterPay;

@property (nonatomic, copy) NSString *planFee;

@property (nonatomic, assign) NSInteger plan;

@property (nonatomic, copy) NSString *rate;

@end

@interface Pcprice : NSObject

@end

@interface Cdn : NSObject

@property (nonatomic, assign) BOOL isReportData;

@property (nonatomic, assign) BOOL isWebpOpen;

@property (nonatomic, assign) BOOL isCdnOpen;

@end

@interface Eventparam : NSObject

@property (nonatomic, copy) NSString *sep;

@end

@interface Yuyueinfo : NSObject

@property (nonatomic, assign) NSInteger yuyueNum;

@property (nonatomic, copy) NSString *buyStartTime;

@property (nonatomic, assign) BOOL isYuYue;

@property (nonatomic, copy) NSString *buyEndTime;

@property (nonatomic, copy) NSString *yuyueType;

@property (nonatomic, copy) NSString *yuYueEndTime;

@property (nonatomic, copy) NSString *yuYueStartTime;

@end

@interface Flashinfo : NSObject

@property (nonatomic, assign) NSInteger state;

@property (nonatomic, assign) NSInteger cd;

@end

@interface Promotion : NSObject

@property (nonatomic, strong) NSArray<Suit *> *suit;

@property (nonatomic, copy) NSString *domain;

@property (nonatomic, copy) NSString *prompt;

@property (nonatomic, strong) NSArray<Gift *> *gift;

@property (nonatomic, copy) NSString *activityTip;

@property (nonatomic, copy) NSString *tip;

@property (nonatomic, copy) NSString *tipImage;

@property (nonatomic, strong) NSArray<Activity *> *activity;

@property (nonatomic, assign) NSInteger packABTest;

@property (nonatomic, assign) BOOL isTwoLine;

@end

@interface Gift : NSObject

@property (nonatomic, copy) NSString *link;

@property (nonatomic, copy) NSString *num;

@property (nonatomic, copy) NSString *value;

@property (nonatomic, copy) NSString *skuId;

@property (nonatomic, copy) NSString *text;

@end

@interface Activity : NSObject

@property (nonatomic, copy) NSString *text;

@property (nonatomic, copy) NSString *link;

@property (nonatomic, copy) NSString *value;

@property (nonatomic, copy) NSString *promoId;

@property (nonatomic, copy) NSString *skuId;

@property (nonatomic, assign) NSInteger proSortNum;

@end

@interface Suit : NSObject

@property (nonatomic, assign) NSInteger PackId;

@property (nonatomic, copy) NSString *Discount;

@property (nonatomic, assign) NSInteger MainSkuId;

@property (nonatomic, copy) NSString *MainSkuPicUrl;

@property (nonatomic, copy) NSString *PackPrice;

@property (nonatomic, copy) NSString *MainSkuName;

@property (nonatomic, copy) NSString *PackListPrice;

@property (nonatomic, copy) NSString *PackType;

@property (nonatomic, strong) NSArray<Productlist *> *ProductList;

@property (nonatomic, copy) NSString *PackName;

@end

@interface Productlist : NSObject

@property (nonatomic, assign) NSInteger SkuId;

@property (nonatomic, copy) NSString *SkuName;

@property (nonatomic, copy) NSString *SkuPicUrl;

@end

@interface Yushouinfo : NSObject

@property (nonatomic, copy) NSString *yuShouPrice;

@property (nonatomic, copy) NSString *yuShouladder;

@property (nonatomic, copy) NSString *tailMoneyStartTime;

@property (nonatomic, copy) NSString *yuShouNumOfPeople;

@property (nonatomic, copy) NSString *mergedBuyText;

@property (nonatomic, copy) NSString *yuShouDeposit;

@property (nonatomic, copy) NSString *yuShou3LadderData;

@property (nonatomic, copy) NSString *tailMoneyEndTime;

@property (nonatomic, assign) BOOL isMergedBuy;

@property (nonatomic, assign) BOOL isYuShou;

@property (nonatomic, copy) NSString *tailMoney;

@property (nonatomic, copy) NSString *yushouStepType;

@property (nonatomic, copy) NSString *yuShounowStage;

@property (nonatomic, copy) NSString *expectedDeliveryDate;

@property (nonatomic, copy) NSString *yushouRule;

@property (nonatomic, copy) NSString *mergedLogoText;

@property (nonatomic, copy) NSString *yuShouType;

@property (nonatomic, copy) NSString *countdownNumMills;

@end

@interface Mprice : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *value;

@property (nonatomic, assign) BOOL display;

@end

@interface Rankinfo : NSObject

@property (nonatomic, strong) NSArray *rankList;

@property (nonatomic, assign) BOOL isBookSku;

@end

@interface Cutinfo : NSObject

@property (nonatomic, assign) BOOL isCut;

@end

@interface Warmtips : NSObject

@property (nonatomic, copy) NSString *fontColor;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, copy) NSString *imageUrl;

@end

@interface Iconlist : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *tip;

@property (nonatomic, copy) NSString *imageUrl;

@end
