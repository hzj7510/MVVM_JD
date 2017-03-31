//
//  JDProductView.h
//  IOSProjectInit
//
//  Created by mac on 17/3/27.
//  Copyright © 2017年 x5. All rights reserved.
//

#import "BaseView.h"
#import "JDProductDescView.h"
#import "ProductShopView.h"

@interface JDProductView : BaseView
-(instancetype)initWithFrame:(CGRect)frame WithProductType:(PRODUCTVIEWTYPE)type;
-(void)updateTableView;
-(void)updateCollectionView;
//商品详情描述
@property(nonatomic,strong)JDProductDescView *descView;
//评论数组
@property(nonatomic,strong)NSArray *commentArray;
//推荐数组
@property(nonatomic,strong)NSArray *recommendArray;
//评论tableview
@property(nonatomic,strong)UITableView *productTableView;
//底部推荐collectionView
@property(nonatomic,strong)UICollectionView *productCollectionView;
//商铺view
@property(nonatomic,strong)ProductShopView *shopView;
@end
