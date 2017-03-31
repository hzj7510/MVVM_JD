//
//  ProductConfigureView.m
//  ZitoProject
//
//  Created by mac on 17/3/6.
//  Copyright © 2017年 x5. All rights reserved.
//

#import "ProductConfigureView.h"

@interface ProductConfigureView ()
//标题Lb
@property(nonatomic,strong)UILabel *titleLb;
//类型
@property(nonatomic,assign)PRODUCTCONFIGURETYPE type;
@end

@implementation ProductConfigureView

-(instancetype)initWithFrame:(CGRect)frame andProductConfigureType:(PRODUCTCONFIGURETYPE)type{
    self = [super initWithFrame:frame];
    if (self) {
        self.type = type;
        [self setupViewWithType:type];
    }
    return self;
}

-(void)setupViewWithType:(PRODUCTCONFIGURETYPE)type{
    UILabel *lineLb = ({
        UILabel *view = [UILabel new];
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self);
            make.left.mas_equalTo(self).offset(kGetViewWidth(10));
            make.right.mas_equalTo(self).offset(kGetViewWidth(-10));
            make.height.mas_equalTo(1);
        }];
        view.backgroundColor = kGrayColor(241, 1);
        view;
    });
    
    if (type == PRODUCTCONFIGURETYPETIPS) {
        self.tipView = ({
            UILabel *view = [UILabel new];
            [self addSubview:view];
            @weakify(self);
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                @strongify(self);
                make.top.left.mas_equalTo(self).offset(kGetViewWidth(10));
                make.bottom.right.mas_equalTo(self).offset(kGetViewWidth(-10));
            }];
            
            view.font = [UIFont systemFontOfSize:15];
            view.numberOfLines = 0;
            view;
        });
        self.backgroundColor = kGrayColor(247, 1);
        return;
    }
    
    self.titleLb = ({
        UILabel *view = [UILabel new];
        [self addSubview:view];
        @weakify(self);
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.left.mas_equalTo(self).offset(kGetViewWidth(10));
            make.top.mas_equalTo(self).offset(kGetViewHeight(15));
            make.height.mas_equalTo(kGetViewHeight(20));
            make.width.mas_equalTo(kGetViewWidth(40));
        }];
        view.textColor = kGrayColor(126, 1);
        view.font = [UIFont systemFontOfSize:15];
        switch (type) {
            case PRODUCTCONFIGURETYPEPRESS:
                view.text = @"出版社";
                break;
            case PRODUCTCONFIGURETYPEAUTHOR:
                view.text = @"作者";
                break;
            case PRODUCTCONFIGURETYPECOUPON:
                view.text = @"领券";
                break;
            case PRODUCTCONFIGURETYPEADDRESS:
                view.text = @"地址";
                break;
            case PRODUCTCONFIGURETYPESELECTED:
                view.text = @"已选";
                break;
            case PRODUCTCONFIGURETYPEPROMOTION:
                view.text = @"促销";
                break;
                
            default:
                break;
        }
        view;
    });
    
    if(type == PRODUCTCONFIGURETYPEADDRESS){
        self.imgView = ({
            UIImageView *view = [[UIImageView alloc]init];
            [self addSubview:view];
            @weakify(self);
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                @strongify(self);
                make.left.mas_equalTo(self.titleLb.mas_right).offset(kGetViewWidth(12));
                make.centerY.mas_equalTo(self);
                make.height.mas_equalTo(kGetViewHeight(15));
#warning TODO 宽度设置
                if (type == PRODUCTCONFIGURETYPEADDRESS) {
                    make.width.mas_equalTo(kGetViewWidth(12));
                }
            }];
            view.backgroundColor = [UIColor redColor];
            view;
        });
        
        self.contentLb = ({
            UILabel *view = [UILabel new];
            [self addSubview:view];
            @weakify(self);
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                @strongify(self);
                make.left.mas_equalTo(self.imgView.mas_right).offset(kGetViewWidth(5));
                make.centerY.mas_equalTo(self);
            }];
            view.font = [UIFont systemFontOfSize:15];
//            view.text = (NSString *)data;
            view;
        });
        
        if (type == PRODUCTCONFIGURETYPEADDRESS) {
            self.imgView.hidden = NO;
        }
    }else if(type == PRODUCTCONFIGURETYPESELECTED){
        self.selectedLb = ({
            UILabel *view = [UILabel new];
            [self addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.titleLb.mas_right).offset(kGetViewWidth(12));
                make.centerY.mas_equalTo(self);
                make.right.mas_equalTo(self);
            }];
            view.text = @"已选xxxx";
            view;
        });
    }else if((type == PRODUCTCONFIGURETYPEPRESS) || (type == PRODUCTCONFIGURETYPEAUTHOR)){
        UILabel *moreLb = ({
            UILabel *view = [UILabel new];
            [self addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self).offset(kGetViewWidth(12));
                make.centerY.mas_equalTo(self);
            }];
            view;
        });
        
        self.nameLb = ({
            UILabel *view = [UILabel new];
            [self addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.titleLb.mas_right).offset(kGetViewWidth(12));
                make.centerY.mas_equalTo(self);
            }];
            
            view;
        });
    }
}


-(void)setArray:(NSArray *)array{
    if (self.type == PRODUCTCONFIGURETYPECOUPON) {
        UILabel *lastLb;
        CGFloat lbWidth = 0;
        for (int i = 0 ; i < array.count; i++) {
            UILabel *lb = [[UILabel alloc]init];
            lb.text = array[i];
            lb.font = [UIFont systemFontOfSize:kFont(13)];
            NSDictionary *attribute = @{NSFontAttributeName: lb.font};
            CGSize retSize = [lb.text boundingRectWithSize:CGSizeMake(320, 0)
                                                   options:\
                              NSStringDrawingTruncatesLastVisibleLine |
                              NSStringDrawingUsesLineFragmentOrigin |
                              NSStringDrawingUsesFontLeading
                                                attributes:attribute
                                                   context:nil].size;
            lbWidth += retSize.width;
            if (lbWidth > (kScreenWidth - kGetViewWidth(50))) {
                break;
            }
            [self addSubview:lb];
            @weakify(self);
            [lb mas_makeConstraints:^(MASConstraintMaker *make) {
                @strongify(self);
                if (i == 0) {
                    make.left.mas_equalTo(self.titleLb.mas_right).offset(kGetViewWidth(5));
                }else{
                    make.left.mas_equalTo(lastLb.mas_right).offset(kGetViewWidth(20));
                }
                make.height.mas_equalTo(kGetViewHeight(21));
                make.width.mas_equalTo(kGetViewWidth(retSize.width));
                make.centerY.mas_equalTo(self);
            }];
            lastLb = lb;
            lbWidth += kGetViewWidth(20);
            
            UIImageView *imgview = [[UIImageView alloc]init];
            [self addSubview:imgview];
            
            [imgview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.top.mas_equalTo(lb).offset(-2);
                make.bottom.right.mas_equalTo(lb).offset(2);
            }];
        }
    }else if(self.type == PRODUCTCONFIGURETYPEPROMOTION){
        UILabel *lastLb;
        for (int i = 0; i < array.count; i++) {
            UILabel *textLb = ({
                UILabel *view = [UILabel new];
                [self addSubview:view];
                @weakify(self);
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    @strongify(self);
                    
                    if (i == 0) {
                        make.top.mas_equalTo(self.titleLb);
                    }else{
                        make.top.mas_equalTo(lastLb.mas_bottom).offset(kGetViewHeight(3));
                    }
                    make.left.mas_equalTo(self.titleLb.mas_right).offset(kGetViewWidth(10));
                    make.width.mas_greaterThanOrEqualTo(kGetViewWidth(20));
                    
                }];
                view.font = [UIFont systemFontOfSize:kFont(13)];
                view.text = @"..";
                view;
            });
            
            UILabel *valueLb = ({
                UILabel *view = [UILabel new];
                [self addSubview:view];
                @weakify(self);
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    @strongify(self);
                    make.left.mas_equalTo(textLb.mas_right).offset(kGetViewWidth(10));
                    make.top.mas_equalTo(textLb);
                    make.right.mas_equalTo(self).offset(kGetViewWidth(-10));
                }];
                view.font = [UIFont systemFontOfSize:kFont(13)];
                view.text = array[i];
                view.textColor = kRGB(220, 98, 94, 1);
                view;
            });
            //赋值给lastLb
            lastLb = valueLb;
        }
        [lastLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self).offset(kGetViewWidth(-15));
        }];
        
    }
}

@end
