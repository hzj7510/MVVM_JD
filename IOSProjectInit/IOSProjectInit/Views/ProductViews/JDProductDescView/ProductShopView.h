//
//  ProductShopView.h
//  ZitoProject
//
//  Created by mac on 17/3/8.
//  Copyright © 2017年 x5. All rights reserved.
//

#import "BaseView.h"
#import "ShopAssessView.h"

@interface ProductShopView : BaseView
-(instancetype)initWithFrame:(CGRect)frame WithData:(NSDictionary *)data;
//店铺名称
@property(nonatomic,strong)UILabel *shopNameLb;
//店铺简述
@property(nonatomic,strong)UILabel *shopTipLb;
//关注人数
@property(nonatomic,strong)ShopAssessView *followerView;
//商品总数
@property(nonatomic,strong)ShopAssessView *goodsView;
//动态
@property(nonatomic,strong)ShopAssessView *statusView;
@end
