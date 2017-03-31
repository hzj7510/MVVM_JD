//
//  JDProjuectViewController.m
//  IOSProjectInit
//
//  Created by mac on 17/3/21.
//  Copyright © 2017年 x5. All rights reserved.
//

#import "JDProjuectViewController.h"
#import "JDProductView.h"
#import "ProductViewModel.h"

@interface JDProjuectViewController ()
//商品界面
@property(nonatomic,strong)JDProductView *productView;
@end

@implementation JDProjuectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ProductViewModel *viewModel = [[ProductViewModel alloc]init];
    [[viewModel setupModel]subscribeNext:^(RACTuple *x) {
        NSLog(@"%@",x);
        NSNumber *typeNum = x.first;
        [self setupProductViewType:typeNum.integerValue];
        /**
         *  由于这里只需要数据绑定UI所以并没有涉及到双向绑定
         */
        RAC(self.productView.descView.preferentialDescribeLb,attributedText) = RACObserve(viewModel, ad);
        RAC(self.productView.descView.moneyKindLb,text) = RACObserve(viewModel, priceKind);
        RAC(self.productView.descView.jdPriceLb,text) = RACObserve(viewModel, jdPrice);
        RAC(self.productView.descView.discountLb,attributedText) = RACObserve(viewModel, discount);
        RAC(self.productView.descView.mPriceLb,attributedText) = RACObserve(viewModel, mprice);
        RAC(self.productView.descView.couponView,array) = RACObserve(viewModel, couponArr);
        RAC(self.productView.descView.promotionView,array) = RACObserve(viewModel, promotionArr);
        RAC(self.productView.descView.authorView.nameLb,text) = RACObserve(viewModel, bookAuthorInfo);
        RAC(self.productView.descView.pressView.nameLb,text) = RACObserve(viewModel, publish);
        RAC(self.productView.descView.tipsView.tipView,attributedText) = RACObserve(viewModel, tips);
        RAC(self.productView.descView.addressView.contentLb,text) = RACObserve(viewModel, addr);
        RAC(self.productView,commentArray) = RACObserve(viewModel, commentArray);
        RAC(self.productView,recommendArray) = RACObserve(viewModel, recommendArray);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.productView updateTableView];
            [self.productView updateCollectionView];
        });
        RAC(self.productView.shopView.shopNameLb,text) = RACObserve(viewModel, shopName);
        RAC(self.productView.shopView.shopTipLb,text) = RACObserve(viewModel, shopBrief);
        RAC(self.productView.shopView.followerView.quantityLb,text) = [RACObserve(viewModel, followCount) map:^id(NSNumber *value) {
            return value.description;
        }];
        RAC(self.productView.shopView.goodsView.quantityLb,text) = [RACObserve(viewModel, shopTotalNum) map:^id(NSNumber *value) {
            return value.description;
        }];
        RAC(self.productView.shopView.statusView.quantityLb,text) = [RACObserve(viewModel, shopNewNum) map:^id(NSNumber *value) {
            return value.description;
        }];
        
        RAC(self.productView.descView,scrollImgsArray) = RACObserve(viewModel, scrollImgsArray);
    }];
    
}

/**
 *  设置productview视图
 */
-(void)setupProductViewType:(PRODUCTVIEWTYPE)type {
    self.productView = [[JDProductView alloc]initWithFrame:CGRectZero WithProductType:type];
    [self.view addSubview:self.productView];
    @weakify(self);
    [self.productView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.mas_equalTo(self.view);
        make.width.mas_equalTo(kScreenWidth);
        make.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
