//
//  ProductViewModel.m
//  IOSProjectInit
//
//  Created by mac on 17/3/22.
//  Copyright © 2017年 x5. All rights reserved.
//

#import "ProductViewModel.h"
#import "ProductSkuModel.h"
#import "ProductCouponModel.h"
#import "WareModel.h"
#import "ProductCommentModel.h"
#import "ProductRecommendModel.h"
#import "MJExtension.h"

@interface ProductViewModel ()
//商品详情
@property(nonatomic,strong)Wareinfo *productInfo;
//商品优惠
@property(nonatomic,strong)ProductCouponModel *couponModel;
//商品书籍
@property(nonatomic,strong)WareModel *wareModel;
//商品评价
@property(nonatomic,strong)ProductCommentModel *commentModel;
//商品推荐
@property(nonatomic,strong)ProductRecommendModel *recommendModel;
@end

@implementation ProductViewModel

-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(NSDictionary *)readJsonFile:(NSString*)fileLocation{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileLocation stringByDeletingPathExtension] ofType:[fileLocation pathExtension]];
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data
                                                options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}

-(RACSignal *)setupModel{
    @weakify(self);
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
        [[RACSignal combineLatest:@[[self setupDescModel], [self setupAuthorModel], [self setupCommentModel], [self setupCouponModel], [self setupRecommendModel]]] subscribeNext:^(id x) {
            
            [self rebackDescModel];
            [self rebackCommentModel];
            [self rebackRecommendModel];
            [self rebackShopModel];
            
            RACTuple *tuple = [RACTuple tupleWithObjects: @([self rebackType]), nil];
            
            [subscriber sendNext:tuple];
        }];
        return nil;
    }];
}

/**
 *  店铺
 */
-(void)rebackShopModel{
    Shopinfo *shopinfo = self.wareModel.shopInfo;
    self.shopName = shopinfo.shop.name;
    self.shopBrief = shopinfo.shop.brief;
    self.shopScore = shopinfo.shop.score;
    self.wareScore = shopinfo.shop.wareScore;
    self.serviceScore = shopinfo.shop.serviceScore;
    self.efficiencyScore = shopinfo.shop.efficiencyScore;
    self.followCount = shopinfo.shop.followCount;
    self.shopTotalNum = shopinfo.shop.totalNum;
    self.shopNewNum = shopinfo.shop.newNum;
    
    NSMutableArray *array = [NSMutableArray array];
    for (Wareimage *img in self.wareModel.basicInfo.wareImage) {
        [array addObject:img.big];
    }
    self.scrollImgsArray = [array copy];
}

/**
 *  商品推荐model解析
 */
-(void)rebackRecommendModel{
    NSMutableArray *array = [NSMutableArray array];
    for (Wareinfolist *wareList in self.recommendModel.wareInfoList) {
        NSDictionary *dic = @{
                              @"picUrl":wareList.imageurl,
                              @"wname":wareList.wname,
                              @"jdPrice":[NSString stringWithFormat:@"¥%@",wareList.jdPrice],
                              };
        [array addObject:dic];
    }
    
    self.recommendArray = [array copy];
}
/**
 *  商品评论model解析
 */
-(void)rebackCommentModel{
    NSMutableArray *array = [NSMutableArray array];
    for (Commentinfolist *commentList in self.commentModel.commentInfoList) {
        // 可惜这里不是swift ，无法切片
        NSMutableArray *picArray = [NSMutableArray array];

        for (int i = 0 ; i < commentList.pictureInfoList.count; i++) {
            if (i == 3) {
                break;
            }
            Pictureinfolist *picList = commentList.pictureInfoList[i];
            [picArray addObject:picList];
        }
        
        NSDictionary *dic = @{
                              @"score":commentList.commentScore,
                              @"content":commentList.commentData,
                              @"isHaveImgs":@(commentList.pictureInfoList.count == 0),
                              @"imgs":[picArray copy],
                              @"userName":commentList.userNickName,
                              };
        [array addObject:dic];
    }
    self.commentArray = [array copy];
}

-(void)rebackDescModel{
    //金钱类型
    self.priceKind = self.productInfo.priceLabel;
    //京东价格
    self.jdPrice = self.productInfo.jprice.value;
    //设置广告
    NSMutableAttributedString *adAttributStr = nil;
    if (self.productInfo.ad.adword.length != 0) {
        adAttributStr = [[NSMutableAttributedString alloc]initWithString:self.productInfo.ad.adword];
        NSRange range = [self.productInfo.ad.adword rangeOfString:self.productInfo.ad.adLinkContent];
        [adAttributStr addAttribute:NSLinkAttributeName value:[NSURL URLWithString:self.productInfo.ad.adLink] range:range];
        //广告价格赋值
        self.ad = adAttributStr;
    }
    NSMutableAttributedString *mpriceStr = nil;
    NSMutableAttributedString *discountStr =nil;
    //设置打折
    if (self.productInfo.discount.display) {
        NSString *str = [NSString stringWithFormat:@"%@%@",self.productInfo.discount.discount,self.productInfo.discount.desc];
        discountStr = [[NSMutableAttributedString alloc]initWithString:str attributes:@{
                                                                                                                  NSFontAttributeName:[UIFont systemFontOfSize:kFont(13)],
                                                                                                                  NSForegroundColorAttributeName:[UIColor lightGrayColor]
                                                                                                                  }];
        
        //打折价格赋值
        self.discount = discountStr;
        
    }
    
    if (self.productInfo.mprice.display) {
        mpriceStr = [[NSMutableAttributedString alloc]initWithString:self.productInfo.mprice.value attributes:@{
                                                                                                                NSFontAttributeName:[UIFont systemFontOfSize:kFont(13)],
                                                                                                                NSForegroundColorAttributeName:[UIColor lightGrayColor],
                                                                                                                NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle),
                                                                                                                NSStrikethroughColorAttributeName:[UIColor lightGrayColor]
                                                                                                                }];
        //原价赋值
        self.mprice = mpriceStr;
    }
    
    NSMutableArray *promotionArr = [NSMutableArray array];
    if (self.productInfo.promotion.activity.count != 0 || self.productInfo.promotion.gift.count != 0 || self.productInfo.promotion.suit.count != 0) {
        if (self.productInfo.promotion.activity.count != 0) {
            for (Activity *activity in self.productInfo.promotion.activity) {
                [promotionArr addObject:activity.value];
            }
        }
        if (self.productInfo.promotion.suit.count != 0) {
            CGFloat maxDiscount = 0;
            for (Suit *suit in self.productInfo.promotion.suit) {
                if (suit.Discount.doubleValue > maxDiscount) {
                    maxDiscount = suit.Discount.doubleValue;
                }
            }
            [promotionArr addObject:[NSString stringWithFormat:@"最高省%.1f元",maxDiscount]];
        }
        if (self.productInfo.promotion.gift.count != 0) {
            for (Gift *gift in self.productInfo.promotion.gift) {
                [promotionArr addObject:gift.value];
            }
        }
        
        self.promotionArr = [promotionArr copy];
    }
    
    NSMutableArray *couponArr = [NSMutableArray array];
    if (self.couponModel.couponInfo.count != 0) {
        for (Couponinfo *couponInfo in self.couponModel.couponInfo) {
            [couponArr addObject:[NSString stringWithFormat:@"满%ld减%ld",couponInfo.quota,couponInfo.discount]];
        }
        self.couponArr = [couponArr copy];
    }
    
    NSString *authStr = nil;
    NSString *publishStr = nil;
    if (self.wareModel.basicInfo.bookInfo.display) {
        authStr = self.wareModel.basicInfo.bookInfo.author;
        publishStr = self.wareModel.basicInfo.bookInfo.publisher;
        self.bookAuthorInfo = authStr;
        self.publish = publishStr;
    }
    //地址
    Defaultaddr *addr = self.productInfo.defaultAddr;
    NSString *addressStr = [NSString stringWithFormat:@"%@%@%@%@",addr.provinceName,addr.cityName,addr.countyName,addr.townName];
    self.addr = addressStr;
    //添加小图标
    NSTextAttachment *attch = [[NSTextAttachment alloc]init];
    attch.image = [UIImage imageNamed:@"jdimg"];
    attch.bounds = CGRectMake(0, -kGetViewHeight(2), kGetViewWidth(15), kGetViewWidth(15));
    NSMutableString *str = [NSMutableString string];
    for (Iconlist *icon in self.productInfo.iconList) {
        [str appendString:[NSString stringWithFormat:@"%@",icon.name]];
    }
    NSMutableAttributedString *mutableStr = [[NSMutableAttributedString alloc]initWithString:[str copy]];
    int count = 0;
    for (int i = 0;i < self.productInfo.iconList.count ;i++) {
        Iconlist *icon = self.productInfo.iconList[i];
        
        [mutableStr insertAttributedString:[NSAttributedString attributedStringWithAttachment:attch] atIndex:count];
        count += icon.name.length + 1 + i;
    }
    self.tips = mutableStr;
}

-(PRODUCTVIEWTYPE)rebackType{
    PRODUCTVIEWTYPE type = PRODUCTVIEWTYPENONE;
    if (self.productInfo.ad.adword.length != 0) {
        type = type | PRODUCTVIEWTYPEWITHAD;
    }
    if (self.productInfo.discount.display) {
        type = type | PRODUCTVIEWTYPEDISCOUNT;
    }
    if (self.productInfo.mprice.display){
        type = type | PRODUCTVIEWTYPEMPRICE;
    }
    if (self.productInfo.promotion.activity.count != 0) {
        type = type | PRODUCTVIEWTYPEPROMOTION;
    }
    if (self.couponModel.couponInfo.count != 0) {
        type = type | PRODUCTVIEWTYPECOUPON;
    }
    if (self.wareModel.basicInfo.bookInfo.display) {
        type = type | PRODUCTVIEWTYPEAUTHOR;
        type = type | PRODUCTVIEWTYPEPRESS;
    }
    return type;
}

-(RACSignal *)setupDescModel{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [[RACScheduler mainThreadScheduler]afterDelay:0.5 schedule:^{
            NSDictionary *dic = [self readJsonFile:@"ProductDetailModel.json"];
            self.productInfo = [Wareinfo mj_objectWithKeyValues:dic[@"wareInfo"]];
            [subscriber sendNext:@"1"];
            [subscriber sendCompleted];
        }];
        
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
}


-(RACSignal *)setupCommentModel{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSDictionary *dic = [self readJsonFile:@"CommentModel.json"];
        self.commentModel = [ProductCommentModel mj_objectWithKeyValues:dic];
        [subscriber sendNext:@"1"];
        [subscriber sendCompleted];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
}

-(RACSignal *)setupAuthorModel{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [[RACScheduler mainThreadScheduler]afterDelay:2.5 schedule:^{
            NSDictionary *dic = [self readJsonFile:@"WareModel.json"];
            self.wareModel = [WareModel mj_objectWithKeyValues:dic];
            [subscriber sendNext:@"1"];
            [subscriber sendCompleted];
        }];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
}

-(RACSignal *)setupCouponModel{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [[RACScheduler mainThreadScheduler]afterDelay:2 schedule:^{
            NSDictionary *dic = [self readJsonFile:@"CouponModel.json"];
            self.couponModel = [ProductCouponModel mj_objectWithKeyValues:dic];
            [subscriber sendNext:@"1"];
            [subscriber sendCompleted];
        }];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
}

-(RACSignal *)setupRecommendModel{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [[RACScheduler mainThreadScheduler]afterDelay:5 schedule:^{
            NSDictionary *dic = [self readJsonFile:@"RecommendModel.json"];
            self.recommendModel = [ProductRecommendModel mj_objectWithKeyValues:dic];
            [subscriber sendNext:@"1"];
            [subscriber sendCompleted];
        }];
        
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
}

@end
