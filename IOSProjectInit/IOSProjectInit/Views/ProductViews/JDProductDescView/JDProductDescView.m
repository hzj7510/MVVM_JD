//
//  JDProductDescView.m
//  IOSProjectInit
//
//  Created by mac on 17/3/27.
//  Copyright © 2017年 x5. All rights reserved.
//

#import "JDProductDescView.h"


@interface JDProductDescView ()
//轮播图view
@property(nonatomic,strong)UIScrollView *scrollView;
/**
 *  作为指针指向最后一个view
 */
@property(nonatomic,strong)UILabel *lastView;

@property(nonatomic,strong)UILabel *totalLb;

@end

@implementation JDProductDescView

-(instancetype)initWithFrame:(CGRect)frame WithProductType:(PRODUCTVIEWTYPE)type{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViewWithType:type];
    }
    return self;
}

-(void)setupViewWithType:(PRODUCTVIEWTYPE)type{
    /**
     *  商品详情轮播图view
     */
    self.scrollView = ({
        UIScrollView *view = [[UIScrollView alloc]init];
        [self addSubview:view];
        @weakify(self);
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.top.left.mas_equalTo(self);
            make.width.mas_equalTo(kScreenWidth);
            make.height.mas_equalTo(kScreenWidth);
        }];
        view.pagingEnabled = YES;
        view;
    });
    
    UIView *numView = ({
        UIView *view = [UIView new];
        [self addSubview:view];
        @weakify(self);
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.right.bottom.mas_equalTo(self.scrollView).offset(-kGetViewWidth(12));
            make.width.mas_equalTo(kGetViewWidth(40));
            make.height.mas_equalTo(kGetViewHeight(40));
        }];
        view.backgroundColor = kGrayColor(0.2, 0.1);
        view;
    });
    UILabel *currentLb = ({
        UILabel *view = [UILabel new];
        [numView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(numView);
            make.right.mas_equalTo(numView.mas_centerX).offset(-kGetViewWidth(2));
        }];
        view.textColor = [UIColor whiteColor];
        view.font = [UIFont systemFontOfSize:14];
        view.text = @"1";
        view;
    });
    
    self.totalLb = ({
        UILabel *view = [UILabel new];
        [numView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(numView).offset(kGetViewHeight(2));
            make.left.mas_equalTo(numView.mas_centerX);
        }];
        view.textColor = [UIColor whiteColor];
        view.font = [UIFont systemFontOfSize:14];
        view;
    });
    
    /**
     *  绑定总页数 ， 滚动页数与offset
     */
    CGFloat width = kScreenWidth;
    RAC(currentLb,text) = [RACObserve(self.scrollView, contentOffset) map:^id(NSValue *value) {
        CGPoint offsetPoint = [value CGPointValue];
        return [NSString stringWithFormat:@"%ld",(NSInteger)(roundl(offsetPoint.x / width) + 1)];
    }];
    
    
    /**
     *  商品详情描述
     */
    self.productDetailLb = ({
        UILabel *view = [[UILabel alloc]init];
        [self addSubview:view];
        @weakify(self);
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.left.mas_equalTo(self).offset(kGetViewWidth(10));
            make.right.mas_equalTo(self).offset(-kGetViewWidth(10));
            make.top.mas_equalTo(self.scrollView.mas_bottom).offset(kGetViewHeight(12));
        }];
        view.numberOfLines = 2;
        view.font = [UIFont systemFontOfSize:kFont(12)];
        view.text = @"西部数据(WD)蓝盘 1TB SATA6Gb/s 7200转64M 台式机硬盘(WD10EZEX)";
        view;
    });
    /**
     *  ad广告位
     */
    if (type & PRODUCTVIEWTYPEWITHAD) {
        self.preferentialDescribeLb = ({
            UILabel *view = [UILabel new];
            [self addSubview:view];
            @weakify(self);
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                @strongify(self);
                make.left.mas_equalTo(self).offset(kGetViewWidth(10));
                make.right.mas_equalTo(self).offset(-kGetViewWidth(10));
                make.top.mas_equalTo(self.productDetailLb.mas_bottom).offset(kGetViewHeight(12));
            }];
            view.font = [UIFont systemFontOfSize:kFont(12)];
            view.textColor = kRGB(220, 85, 79, 1);
            view.numberOfLines = 0;
            self.lastView = view;
            view;
        });
    }
    /**
     *  商品价格类型与价格
     *
     */
    self.moneyKindLb = ({
        UILabel *view = [UILabel new];
        [self addSubview:view];
        @weakify(self);
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.left.mas_equalTo(self).offset(kGetViewWidth(10));
            make.top.mas_equalTo(self.lastView.mas_bottom).offset(kGetViewHeight(12));
        }];
        view.textColor = kRGB(220, 85, 79, 1);
        view;
    });
    self.jdPriceLb = ({
        UILabel *view = [UILabel new];
        [self addSubview:view];
        @weakify(self);
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.left.mas_equalTo(self.moneyKindLb.mas_right).offset(kGetViewWidth(3));
            make.centerY.mas_equalTo(self.moneyKindLb);
        }];
        view.font = [UIFont systemFontOfSize:kFont(20)];
        view.textColor = kRGB(220, 85, 79, 1);
//        view.text = dataDic[@"jdpricd"];
        self.lastView = view;
        view;
    });
    
    /**
     *  打折优惠lb
     */
    if (type & PRODUCTVIEWTYPEMPRICE){
        self.mPriceLb = ({
            UILabel *view = [UILabel new];
            [self addSubview:view];
            @weakify(self);
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                @strongify(self);
                make.left.mas_equalTo(self).offset(kGetViewWidth(10));
                make.top.mas_equalTo(self.lastView.mas_bottom).offset(kGetViewHeight(3));
            }];
            view.font = [UIFont systemFontOfSize:kFont(16)];
            view;
        });
    }
    if (type & PRODUCTVIEWTYPEDISCOUNT) {
        self.discountLb = ({
            UILabel *view = [UILabel new];
            [self addSubview:view];
            @weakify(self);
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                @strongify(self);
                make.left.mas_equalTo(self.mPriceLb.mas_right).offset(kGetViewWidth(12));
                make.centerY.mas_equalTo(self.mPriceLb);
            }];
            view.font = [UIFont systemFontOfSize:kFont(13)];
            self.lastView = view;
            view;
        });
    }
    
    /**
     *  优惠券
     */
    if (type & PRODUCTVIEWTYPECOUPON) {
        self.couponView = [[ProductConfigureView alloc]initWithFrame:CGRectZero andProductConfigureType:PRODUCTCONFIGURETYPECOUPON];
        [self addSubview:self.couponView];
        @weakify(self);
        [self.couponView mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.right.left.mas_equalTo(self);
            make.top.mas_equalTo(self.lastView.mas_bottom);
            make.height.mas_equalTo(kGetViewHeight(50));
        }];
        self.lastView = self.couponView;
    }
    
    /**
     *  商品促销
     */
    if (type & PRODUCTVIEWTYPEPROMOTION) {
        self.promotionView = [[ProductConfigureView alloc]initWithFrame:CGRectZero andProductConfigureType:PRODUCTCONFIGURETYPEPROMOTION];
        [self addSubview:self.promotionView];
        @weakify(self);
        [self.promotionView mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.right.left.mas_equalTo(self);
            make.top.mas_equalTo(self.lastView.mas_bottom);
        }];
        self.lastView = self.promotionView;
    }
    /**
     *  作者view
     */
    if (type & PRODUCTVIEWTYPEAUTHOR) {
        self.authorView = ({
           ProductConfigureView *view = [[ProductConfigureView alloc]initWithFrame:CGRectZero andProductConfigureType:PRODUCTCONFIGURETYPEAUTHOR];
            [self addSubview:view];
            @weakify(self);
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                @strongify(self);
                make.right.left.mas_equalTo(self);
                make.top.mas_equalTo(self.lastView.mas_bottom);
                make.height.mas_equalTo(kGetViewHeight(50));
            }];
            self.lastView = view;
            view;
        });
    }
    /**
     *  出版社
     */
    if (type & PRODUCTVIEWTYPEPRESS) {
        self.pressView = ({
            ProductConfigureView *view = [[ProductConfigureView alloc]initWithFrame:CGRectZero andProductConfigureType:PRODUCTCONFIGURETYPEPRESS];
            [self addSubview:view];
            @weakify(self);
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                @strongify(self);
                make.right.left.mas_equalTo(self);
                make.top.mas_equalTo(self.lastView.mas_bottom);
                make.height.mas_equalTo(kGetViewHeight(50));
            }];
            self.lastView = view;
            view;
        });
    }
    /**
     *  已选
     */
    self.selectedView = ({
        ProductConfigureView *view = [[ProductConfigureView alloc]initWithFrame:CGRectZero andProductConfigureType:PRODUCTCONFIGURETYPESELECTED];
        [self addSubview:view];
        @weakify(self);
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.right.left.mas_equalTo(self);
            make.top.mas_equalTo(self.lastView.mas_bottom);
            make.height.mas_equalTo(kGetViewHeight(50));
        }];
        self.lastView = view;
        view;
    });
    
    /**
     *  送至
     */
    self.addressView = ({
        ProductConfigureView *view = [[ProductConfigureView alloc]initWithFrame:CGRectZero andProductConfigureType:PRODUCTCONFIGURETYPEADDRESS];
        [self addSubview:view];
        @weakify(self);
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.right.left.mas_equalTo(self);
            make.top.mas_equalTo(self.lastView.mas_bottom);
            make.height.mas_equalTo(kGetViewHeight(50));
        }];
        self.lastView = view;
        view;
    });
    
    /**
     *  tipsview
     */
    self.tipsView = ({
        ProductConfigureView *view = [[ProductConfigureView alloc]initWithFrame:CGRectZero andProductConfigureType:PRODUCTCONFIGURETYPETIPS];
        [self addSubview:view];
        @weakify(self);
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.right.left.mas_equalTo(self);
            make.top.mas_equalTo(self.lastView.mas_bottom);
        }];
        self.lastView = view;
        view;
    });
    
    /**
     *  更新self的高度
     */
    @weakify(self);
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.left.right.mas_equalTo(self.scrollView);
        make.bottom.mas_equalTo(self.lastView);
    }];
}

#pragma mark - set get 方法
-(void)setScrollImgsArray:(NSArray *)scrollImgsArray{
    _scrollImgsArray = scrollImgsArray;

    _totalLb.text = [NSString stringWithFormat:@"/%ld",scrollImgsArray.count];
    _scrollView.contentSize = CGSizeMake(kScreenWidth * scrollImgsArray.count, kScreenWidth);
    
    for (int i = 0; i < scrollImgsArray.count; i++) {
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth * i, 0, kScreenWidth, kScreenWidth)];
        [imgView sd_setImageWithURL:[NSURL URLWithString:scrollImgsArray[i]]];
//        imgView.backgroundColor = kRGB((10 + 20 * i), (255 - 20 * i), 255, 1);
        [_scrollView addSubview:imgView];
    }
}
@end
