//
//  JDProductView.m
//  IOSProjectInit
//
//  Created by mac on 17/3/27.
//  Copyright © 2017年 x5. All rights reserved.
//

#import "JDProductView.h"
#import "ProductCommentTableViewCell.h"
#import "ProductRecommendCollectionViewCell.h"

#define CommentCellIdentify @"CommentCell"
#define CommentCellWithImageIdentify @"CommentWithImageCell"
#define RecommendCellIdentify @"ReCommendCell"


@interface JDProductView ()<
UICollectionViewDelegate,
UICollectionViewDataSource,
UITableViewDelegate,
UITableViewDataSource
>
//scrollview container view
@property(nonatomic,strong)UIView *container;

@end

@implementation JDProductView

-(instancetype)initWithFrame:(CGRect)frame WithProductType:(PRODUCTVIEWTYPE)type{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViewWithType:type];
    }
    return self;
}

-(void)setupViewWithType:(PRODUCTVIEWTYPE)type{
    //设置全局scrollview
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    [self addSubview:scrollView];
    @weakify(self);
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.edges.mas_equalTo(self);
    }];
    
    self.container = [[UIView alloc]init];
    [scrollView addSubview:self.container];
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.edges.mas_equalTo(scrollView);
        make.width.mas_equalTo(self);
    }];
    //设置商品描述view
    self.descView = [[JDProductDescView alloc]initWithFrame:CGRectZero WithProductType:type];
    [self.container addSubview:self.descView];
    [self.descView mas_makeConstraints:^(MASConstraintMaker *make) {
       @strongify(self);
        make.left.right.mas_equalTo(self.container);
        make.top.mas_equalTo(self.container);
    }];
    
    /**
     *  商品描述与tableView之间的空白条
     */
    UILabel *tableViewTopLineLb = (UILabel *)[self lineView];
    [tableViewTopLineLb mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.right.mas_equalTo(self.container);
        make.height.mas_equalTo(kGetViewHeight(10));
        make.top.mas_equalTo(self.descView.mas_bottom);
    }];
    /**
     *  商品评论等tableView
     */
    [self.container addSubview:self.productTableView];
    [self.productTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.right.mas_equalTo(self.container);
        make.height.mas_equalTo(160);
        make.top.mas_equalTo(tableViewTopLineLb.mas_bottom);
    }];
    [self.productTableView registerClass:[ProductCommentTableViewCell class] forCellReuseIdentifier:CommentCellIdentify];
    self.productTableView.tableHeaderView = [self tableViewWithIsHeader:YES];
    self.productTableView.tableFooterView = [self tableViewWithIsHeader:NO];
    //店铺
    UILabel *shopTopLineLb = (UILabel *)[self lineView];
    [shopTopLineLb mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.right.mas_equalTo(self.container);
        make.height.mas_equalTo(kGetViewHeight(10));
        make.top.mas_equalTo(self.productTableView.mas_bottom);
    }];
    
    self.shopView = [[ProductShopView alloc]initWithFrame:CGRectZero WithData:@{@"1":@"2"}];
    [self.container addSubview:self.shopView];
    [self.shopView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.right.mas_equalTo(self.container);
        make.top.mas_equalTo(shopTopLineLb.mas_bottom);
    }];
    //热门推荐上面的分隔条
    UILabel *recommendLineLb = (UILabel *)[self lineView];
    [recommendLineLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.container);
        make.height.mas_equalTo(kGetViewHeight(10));
        make.top.mas_equalTo(self.shopView.mas_bottom);
    }];
    
    UILabel *recommendLb = ({
        UILabel *view = [UILabel new];
        [self.container addSubview:view];
        @weakify(self);
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.height.mas_equalTo(kGetViewHeight(43));
            make.left.right.mas_equalTo(self.container);
            make.top.mas_equalTo(recommendLineLb.mas_bottom);
        }];
        view.textAlignment = NSTextAlignmentCenter;
        view.font = [UIFont systemFontOfSize:kFont(15)];
        view.text = @"热门推荐";
        view.textColor = kRGB(225, 104, 98, 1);
        view;
    });
    
    [self addSubview:self.productCollectionView];
    [self.productCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.mas_equalTo(recommendLb.mas_bottom);
        make.left.mas_equalTo(self.container).offset(5);
        make.right.mas_equalTo(self.container).offset(-5);
        make.height.mas_equalTo(kGetViewHeight(190));
    }];
    [self.productCollectionView registerClass:[ProductRecommendCollectionViewCell class] forCellWithReuseIdentifier:RecommendCellIdentify];
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.bottom.mas_equalTo(self.productCollectionView.mas_bottom);
    }];
    
    [self.container mas_updateConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.bottom.mas_equalTo(self.productCollectionView);
    }];
}

/**
 *  tableView的headerview or footerview
 *
 *  @param isHeader 是否是HeaderView
 *
 */
-(UIView *)tableViewWithIsHeader:(BOOL)isHeader{
    CGFloat height = isHeader ? kGetViewWidth(40.0): kGetViewHeight(65.0);
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, height)];
    
    if (isHeader) {
        UILabel *commentLb = ({
            UILabel *view = [UILabel new];
            [backView addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(backView);
                make.left.mas_equalTo(backView).offset(kGetViewWidth(10));
            }];
            view.text = @"评论 ( 305)";
            view.textColor = kGrayColor(188, 1);
            view;
        });
    }else{
        UIButton *moreBtn = ({
            UIButton *view = [UIButton buttonWithType:UIButtonTypeCustom];
            [backView addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(kGetViewWidth(292));
                make.height.mas_equalTo(kGetViewHeight(40));
                make.center.mas_equalTo(backView);
            }];
            [view setTitle:@"查看更多" forState:UIControlStateNormal];
            [view setTitleColor:kGrayColor(102, 1) forState:UIControlStateNormal];
            view.layer.borderColor = kGrayColor(243, 1).CGColor;
            view.layer.borderWidth = 1;
            view;
        });
    }
    
    return backView;
}

/**
 *  两模块之间的间隔条
 */
-(UIView *)lineView{
    UILabel *lineLb = ({
        UILabel *view = [UILabel new];
        [self.container addSubview:view];
        view.backgroundColor = kGrayColor(241, 1);
        view;
    });
    
    return lineLb;
}
/**
 *  更新tableview
 */
-(void)updateTableView{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.productTableView reloadData];
        CGSize size = [self getTbViewContentSize];
        NSLog(@"%f",size.height);
        [self.productTableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(size.height);
        }];
    });
}
/**
 *  更新collectionview
 */
-(void)updateCollectionView{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.productCollectionView reloadData];
    });
}

#pragma mark - tableViewDelegate datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.commentArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    /**
     *  曾在这里出现过内容混乱的问题
     */
    ProductCommentTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[ProductCommentTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CommentCellIdentify];
    }
    NSDictionary *dic = self.commentArray[indexPath.row];
    cell.dic = dic;
    return cell;
}

#pragma mark - collectionDelegate Datasource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.recommendArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ProductRecommendCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:RecommendCellIdentify forIndexPath:indexPath];
    cell.dataDic = self.recommendArray[indexPath.row];
    return cell;
}

#pragma mark - 懒加载
- (UITableView *)productTableView {
    if(_productTableView == nil) {
        _productTableView = [[UITableView alloc] init];
        _productTableView.delegate = self;
        _productTableView.dataSource = self;
        _productTableView.estimatedRowHeight = 40;
        _productTableView.rowHeight = UITableViewAutomaticDimension;
    }
    return _productTableView;
}

-(CGSize)getTbViewContentSize{
    [self.productTableView layoutIfNeeded];
    return self.productTableView.contentSize;
}

- (UICollectionView *)productCollectionView {
    if(_productCollectionView == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize = CGSizeMake(kGetViewWidth(120), kGetViewHeight(184));
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing = kGetViewWidth(7.5);
        
        _productCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _productCollectionView.delegate = self;
        _productCollectionView.dataSource = self;
        _productCollectionView.showsVerticalScrollIndicator = NO;
        _productCollectionView.showsHorizontalScrollIndicator = NO;
        _productCollectionView.bounces = NO;
        _productCollectionView.pagingEnabled = YES;
        _productCollectionView.backgroundColor = [UIColor whiteColor];
    }
    return _productCollectionView;
}

- (NSArray *)commentArray {
    if(_commentArray == nil) {
        _commentArray = [[NSArray alloc] init];
    }
    return _commentArray;
}

- (NSArray *)recommendArray {
    if(_recommendArray == nil) {
        _recommendArray = [[NSArray alloc] init];
    }
    return _recommendArray;
}

@end
