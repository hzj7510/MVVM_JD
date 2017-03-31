//
//  ShopAssessView.h
//  ZitoProject
//
//  Created by mac on 17/3/8.
//  Copyright © 2017年 x5. All rights reserved.
//

#import "BaseView.h"

@interface ShopAssessView : BaseView
-(instancetype)initWithFrame:(CGRect)frame WithData:(NSString *)data andIsWithLine:(BOOL)isHaveLine;
@property(nonatomic,strong)UILabel *quantityLb;
@end
