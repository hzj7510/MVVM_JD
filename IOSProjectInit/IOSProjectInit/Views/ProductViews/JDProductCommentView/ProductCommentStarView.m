//
//  ProductCommentStarView.m
//  ZitoProject
//
//  Created by mac on 17/3/7.
//  Copyright © 2017年 x5. All rights reserved.
//

#import "ProductCommentStarView.h"

@interface ProductCommentStarView ()
@property(nonatomic,strong)NSMutableArray *imgViewArray;
@end

@implementation ProductCommentStarView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

-(void)setupView{
    
    for (int i = 0; i < 5; i ++ ) {
        UIImageView *imgView = [[UIImageView alloc]init];
        [self.imgViewArray addObject:imgView];
    }
    
    UIStackView *stackView = [[UIStackView alloc]initWithArrangedSubviews:self.imgViewArray];
    stackView.axis = UILayoutConstraintAxisHorizontal;
    //注意这里  设置最好为 高11  宽67
    stackView.spacing = 3;
    stackView.alignment = UIStackViewAlignmentFill;
    stackView.distribution = UIStackViewDistributionFillEqually;
    [self addSubview:stackView];
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}

#pragma mark - 懒加载

- (NSMutableArray *)imgViewArray {
    if(_imgViewArray == nil) {
        _imgViewArray = [[NSMutableArray alloc] init];
    }
    return _imgViewArray;
}

#pragma mark - set get 方法

-(void)setScore:(double)score{
    _score = score;
    int scoreR = (int)round(score);
    
    for (int i = 0; i < 5; i++) {
        UIImageView *imgView = _imgViewArray[i];
        if (scoreR > score){
            if(i < (scoreR - 1)){
                imgView.image = [UIImage imageNamed:@"iconfont-xing"];
            }else{
                imgView.image = [UIImage imageNamed:@"iconfont-xingunselected"];
            }
        }else{
            if(i < scoreR){
                imgView.image = [UIImage imageNamed:@"iconfont-xing"];
            }else{
                imgView.image = [UIImage imageNamed:@"iconfont-xingunselected"];
            }
        }
    }
}

@end
