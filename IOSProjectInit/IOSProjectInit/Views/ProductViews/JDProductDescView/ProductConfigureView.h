//
//  ProductConfigureView.h
//  ZitoProject
//
//  Created by mac on 17/3/6.
//  Copyright © 2017年 x5. All rights reserved.
//

#import "BaseView.h"

typedef enum : NSUInteger {
    /**
     *  促销
     */
    PRODUCTCONFIGURETYPEPROMOTION,
    /**
     *  tipsView
     */
    PRODUCTCONFIGURETYPETIPS,
    /**
     *  优惠券
     */
    PRODUCTCONFIGURETYPECOUPON,
    /**
     *  地址
     */
    PRODUCTCONFIGURETYPEADDRESS,
    /**
     *  已选
     */
    PRODUCTCONFIGURETYPESELECTED,
    /**
     *  作者
     */
    PRODUCTCONFIGURETYPEAUTHOR,
    /**
     *  出版社
     */
    PRODUCTCONFIGURETYPEPRESS,
} PRODUCTCONFIGURETYPE;

@interface ProductConfigureView : BaseView

/**
 *  初始化 如果是创建
 *
 *  @param frame     View的Frame
 *  @param type      View类型
 *  @param dataArray 如果创建的是优惠券与促销需要将Array传入此处
 *
 *  @return 返回值对象
 */
-(instancetype)initWithFrame:(CGRect)frame andProductConfigureType:(PRODUCTCONFIGURETYPE)type;
@property(nonatomic,strong)NSArray *array;
//tipsView
@property(nonatomic,strong)UILabel *tipView;
//小图标View
@property(nonatomic,strong)UIImageView *imgView;
//内容Lb
@property(nonatomic,strong)UILabel *contentLb;
//book names(作者出版社名)
@property(nonatomic,strong)UILabel *nameLb;
//已选按钮lb
@property(nonatomic,strong)UILabel *selectedLb;
@end
