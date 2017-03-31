//
//  JDProductDescView.h
//  IOSProjectInit
//
//  Created by mac on 17/3/27.
//  Copyright © 2017年 x5. All rights reserved.
//

#import "BaseView.h"
#import "ProductConfigureView.h"

@interface JDProductDescView : BaseView
//轮播图数组
@property(nonatomic,strong)NSArray *scrollImgsArray;

-(instancetype)initWithFrame:(CGRect)frame WithProductType:(PRODUCTVIEWTYPE)type;
//商品描述lb
@property(nonatomic,strong)UILabel *productDetailLb;
//优惠描述lb
@property(nonatomic,strong)UILabel *preferentialDescribeLb;
//金额类型lb (如 ¥ or $)
@property(nonatomic,strong)UILabel *moneyKindLb;
//金额lb
@property(nonatomic,strong)UILabel *jdPriceLb;
//打折优惠lb
@property(nonatomic,strong)UILabel *discountLb;
//原价
@property(nonatomic,strong)UILabel *mPriceLb;
//作者
@property(nonatomic,strong)ProductConfigureView *authorView;
//出版社
@property(nonatomic,strong)ProductConfigureView *pressView;
//优惠券
@property(nonatomic,strong)ProductConfigureView *couponView;
//促销
@property(nonatomic,strong)ProductConfigureView *promotionView;
//已选
@property(nonatomic,strong)ProductConfigureView *selectedView;
//送至
@property(nonatomic,strong)ProductConfigureView *addressView;
//标签
@property(nonatomic,strong)ProductConfigureView *tipsView;
@end
