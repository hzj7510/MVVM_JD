//
//  ProductRecommendCollectionViewCell.m
//  ZitoProject
//
//  Created by mac on 17/3/9.
//  Copyright © 2017年 x5. All rights reserved.
//

#import "ProductRecommendCollectionViewCell.h"

@interface ProductRecommendCollectionViewCell ()
@property(nonatomic,strong)UIImageView *goodsImgView;
@property(nonatomic,strong)UILabel *goodsTitleLb;
@property(nonatomic,strong)UILabel *goodsPriceLb;
@end

@implementation ProductRecommendCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

-(void)setupView{
    
    self.goodsImgView = ({
        UIImageView *view = [[UIImageView alloc]init];
        [self addSubview:view];
        @weakify(self);
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.top.left.right.mas_equalTo(self);
            make.height.mas_equalTo(kGetViewHeight(123));
        }];
        view;
    });
    
    
    self.goodsTitleLb = ({
        UILabel *view = [UILabel new];
        [self addSubview:view];
        @weakify(self);
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.top.mas_equalTo(self.goodsImgView.mas_bottom).offset(kGetViewHeight(1));
            make.left.mas_equalTo(self).offset(kGetViewWidth(6));
            make.right.mas_equalTo(self).offset(kGetViewWidth(-6));
            make.height.mas_equalTo(kGetViewHeight(40));
        }];
        view.font = [UIFont systemFontOfSize:kFont(13)];
        view.textColor = kGrayColor(102, 1);
        view.numberOfLines = 2;
        view;
    });
    
    self.goodsPriceLb = ({
        UILabel *view = [UILabel new];
        [self addSubview:view];
        @weakify(self);
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.top.mas_equalTo(self.goodsTitleLb.mas_bottom).offset(kGetViewHeight(1));
            make.left.mas_equalTo(self).offset(kGetViewWidth(6));
            make.right.mas_equalTo(self).offset(kGetViewWidth(-6));
        }];
        view.font = [UIFont systemFontOfSize:kFont(15)];
        view;
    });
}

-(void)setDataDic:(NSDictionary *)dataDic{
    self.goodsPriceLb.text = dataDic[@"jdPrice"];
    [self.goodsImgView sd_setImageWithURL:[NSURL URLWithString:dataDic[@"picUrl"]]];
    self.goodsTitleLb.text = dataDic[@"wname"];
}

@end
