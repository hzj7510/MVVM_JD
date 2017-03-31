//
//  ProductShopView.m
//  ZitoProject
//
//  Created by mac on 17/3/8.
//  Copyright © 2017年 x5. All rights reserved.
//

#import "ProductShopView.h"


@implementation ProductShopView

-(instancetype)initWithFrame:(CGRect)frame WithData:(NSDictionary *)data{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViewWithData:data];
    }
    return self;
}

-(void)setupViewWithData:(NSDictionary *)data{
    UIImageView *shopImgView = ({
        UIImageView *view = [[UIImageView alloc]init];
        [self addSubview:view];
        @weakify(self);
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.left.mas_equalTo(self).offset(kGetViewWidth(10));
            make.top.mas_equalTo(self).offset(kGetViewHeight(15));
            make.width.mas_equalTo(kGetViewWidth(80));
            make.height.mas_equalTo(kGetViewHeight(27));
        }];
        view.backgroundColor = [UIColor redColor];
        view;
    });
    
    self.shopNameLb = ({
        UILabel *view = [UILabel new];
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(shopImgView.mas_right).offset(kGetViewWidth(10));
            make.top.mas_equalTo(shopImgView);
        }];
        view.text = @"tinghsuo niye cunzaiguo ";
        view;
    });
    //标语Lb
    self.shopTipLb = ({
        UILabel *view = [UILabel new];
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.shopNameLb);
            make.top.mas_equalTo(self.shopNameLb.mas_bottom).offset(kGetViewHeight(3));
        }];
        view.font = [UIFont systemFontOfSize:kFont(15)];
        view.textColor = kGrayColor(152, 1);
        view.text = @"tinghsuo niye cunzaiguo ";
        view;
    });
    
    self.followerView = [[ShopAssessView alloc]initWithFrame:CGRectZero WithData:@"关注人数" andIsWithLine:YES];
    self.goodsView = [[ShopAssessView alloc]initWithFrame:CGRectZero WithData:@"商品总数" andIsWithLine:YES];
    self.statusView = [[ShopAssessView alloc]initWithFrame:CGRectZero WithData:@"动态数量" andIsWithLine:NO];
    
    UIStackView *assessStack = ({
        UIStackView *view = [[UIStackView alloc]initWithArrangedSubviews:@[self.followerView,self.goodsView,self.statusView]];
        view.axis = 0;
        view.distribution = UIStackViewDistributionFillEqually;
        view.alignment = UIStackViewAlignmentFill;
        view.spacing = 0;
        [self addSubview:view];
        @weakify(self);
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.left.right.mas_equalTo(self);
            make.top.mas_equalTo(self.shopTipLb.mas_bottom).offset(10);
            make.height.mas_equalTo(kGetViewHeight(50));
        }];
        view;
    });
    
    UIButton *contactShoperBtn = ({
        UIButton *view = [UIButton buttonWithType:UIButtonTypeCustom];
        [view setTitle:@"联系卖家" forState:UIControlStateNormal];
        [view setTitleColor:kGrayColor(102, 1) forState:UIControlStateNormal];
        view.layer.borderColor = kGrayColor(174, 1).CGColor;
        view.layer.borderWidth = 1;
        view;
    });
    UIButton *inputShopBtn = ({
        UIButton *view = [UIButton buttonWithType:UIButtonTypeCustom];
        [view setTitle:@"联系卖家" forState:UIControlStateNormal];
        [view setTitleColor:kGrayColor(102, 1) forState:UIControlStateNormal];
        view.layer.borderColor = kGrayColor(174, 1).CGColor;
        view.layer.borderWidth = 1;
        view;
    });
    
    UIStackView *btnStackView = ({
        UIStackView *view = [[UIStackView alloc]initWithArrangedSubviews:@[contactShoperBtn,inputShopBtn]];
        view.axis = 0;
        view.distribution = UIStackViewDistributionFillEqually;
        view.alignment = UIStackViewAlignmentFill;
        view.spacing = 10;
        [self addSubview:view];
        @weakify(self);
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.left.mas_equalTo(self).offset(kGetViewWidth(10));
            make.right.mas_equalTo(self).offset(kGetViewWidth(-10));
            make.top.mas_equalTo(assessStack.mas_bottom).offset(kGetViewHeight(20));
            make.height.mas_equalTo(kGetViewHeight(35));
            make.bottom.mas_equalTo(self).offset(kGetViewHeight(-10));
        }];
        view;
    });
}

@end
