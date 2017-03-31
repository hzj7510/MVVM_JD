//
//  ShopAssessView.m
//  ZitoProject
//
//  Created by mac on 17/3/8.
//  Copyright © 2017年 x5. All rights reserved.
//

#import "ShopAssessView.h"

@implementation ShopAssessView

-(instancetype)initWithFrame:(CGRect)frame WithData:(NSString *)data andIsWithLine:(BOOL)isHaveLine{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViewWithData:data andIsWithLine:isHaveLine];
    }
    return self;
}

-(void)setupViewWithData:(NSString *)data andIsWithLine:(BOOL)isHaveLine{
    UILabel *scoreLb = ({
        UILabel *view = [[UILabel alloc]init];
        [self addSubview:view];
        @weakify(self);
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.centerX.mas_equalTo(self);
            make.top.mas_equalTo(self);
        }];
        view.font = [UIFont systemFontOfSize:kFont(15)];
        view.textColor = kGrayColor(181, 1);
        view;
    });
    
    UILabel *assessTitleLb = ({
        UILabel *view = [[UILabel alloc]init];
        [self addSubview:view];
        @weakify(self);
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.right.mas_equalTo(scoreLb.mas_left).offset(kGetViewWidth(-5));
            make.top.mas_equalTo(self);
        }];
        
        view.font = [UIFont systemFontOfSize:kFont(15)];
        view;
    });
    
    UILabel *lineLb = [self setupLabel];
    @weakify(self);
    [lineLb mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.mas_equalTo(scoreLb.mas_right).offset(kGetViewWidth(5));
        make.height.mas_equalTo(scoreLb);
        make.width.mas_equalTo(1);
    }];
#warning TODO 这里需要添加一个颜色

    
    UILabel *assessLb = [self setupLabel];
    [assessLb mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.mas_equalTo(lineLb.mas_right);
        make.top.mas_equalTo(self);
    }];
    assessLb.font = [UIFont systemFontOfSize:kFont(15)];
    
    self.quantityLb = [self setupLabel];
    [self.quantityLb mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(scoreLb.mas_bottom).offset(kGetViewHeight(3));
    }];
    self.quantityLb.font = [UIFont systemFontOfSize:kFont(19)];
    
    UILabel *titleLb = [self setupLabel];
    [titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self.quantityLb.mas_bottom).offset(kGetViewHeight(3));
    }];
    titleLb.font = [UIFont systemFontOfSize:kFont(15)];
    titleLb.textColor = kGrayColor(181, 1);
    titleLb.text = data;
    
    if (isHaveLine) {
        UILabel *line = [self setupLabel];
        [line  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self);
            make.width.mas_equalTo(1);
            make.bottom.mas_equalTo(self).offset(kGetViewHeight(-5));
            make.height.mas_equalTo(kGetViewHeight(28));
        }];
        line.backgroundColor = kGrayColor(243, 1);
    }
}

/**
 *  由于视图内基本全是lable  所以这里简单返回lable 就不用创建了
 *
 *  @return 返回lb
 */
-(UILabel *)setupLabel{
    UILabel *lb = ({
        UILabel *view = [[UILabel alloc]init];
        [self addSubview:view];
        view;
    });
    
    return lb;
}

@end
