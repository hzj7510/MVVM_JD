//
//  ProductViewModel.h
//  IOSProjectInit
//
//  Created by mac on 17/3/22.
//  Copyright © 2017年 x5. All rights reserved.
//

#import "BaseViewModel.h"

@interface ProductViewModel : BaseViewModel
-(RACSignal *)setupModel;
//金钱类型
@property(nonatomic,copy)NSString *priceKind;
//金额
@property(nonatomic,copy)NSString *jdPrice;
//广告位
@property(nonatomic,strong)NSAttributedString *ad;
//打折
@property(nonatomic,strong)NSAttributedString *discount;
//出厂价
@property(nonatomic,strong)NSAttributedString *mprice;
//tips
@property(nonatomic,strong)NSAttributedString *tips;
//促销
@property(nonatomic,strong)NSArray *promotionArr;
//优惠券
@property(nonatomic,strong)NSArray *couponArr;
//作者
@property(nonatomic,copy)NSString *bookAuthorInfo;
//出版社
@property(nonatomic,copy)NSString *publish;
//地址
@property(nonatomic,copy)NSString *addr;
//评论数组
@property(nonatomic,strong)NSArray *commentArray;
//商品推荐
@property(nonatomic,strong)NSArray *recommendArray;
//店铺名称
@property(nonatomic,strong)NSString *shopName;
//店铺评分
@property(nonatomic,assign)CGFloat shopScore;
//商品评分
@property(nonatomic,assign)CGFloat wareScore;
//物流评分
@property(nonatomic,assign)CGFloat efficiencyScore;
//服务评分
@property(nonatomic,assign)CGFloat serviceScore;
//店铺简述
@property(nonatomic,strong)NSString *shopBrief;
//店铺关注人数
@property(nonatomic,assign)NSInteger followCount;
//店铺商品总数量
@property(nonatomic,assign)NSInteger shopTotalNum;
//店铺动态
@property(nonatomic,assign)NSInteger shopNewNum;
//商品轮播数组
@property(nonatomic,strong)NSArray *scrollImgsArray;
@end
