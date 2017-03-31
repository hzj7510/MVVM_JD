//
//  ProductCommentTableViewCell.m
//  ZitoProject
//
//  Created by mac on 17/3/7.
//  Copyright © 2017年 x5. All rights reserved.
//

#import "ProductCommentTableViewCell.h"
#import "ProductCommentStarView.h"
#import "ProductCommentModel.h"

@interface ProductCommentTableViewCell ()
@property(nonatomic,strong)ProductCommentStarView *starView;
@property(nonatomic,strong)UILabel *commentLb;
@property(nonatomic,strong)UILabel *userNameLb;
@property(nonatomic,strong)NSMutableArray *imgArray;
@end

@implementation ProductCommentTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupView];
    }
    return self;
}

-(void)setupView{
    self.starView = ({
        ProductCommentStarView *view = [[ProductCommentStarView alloc]initWithFrame:CGRectZero];
        [self addSubview:view];
        @weakify(self);
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.left.top.mas_equalTo(self).offset(kGetViewWidth(10));
            make.width.mas_equalTo(kGetViewWidth(67));
            make.height.mas_equalTo(kGetViewHeight(11));
        }];
        view;
    });
    self.userNameLb = ({
        UILabel *view = [[UILabel alloc]init];
        [self addSubview:view];
        @weakify(self);
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.right.mas_equalTo(self).offset(-kGetViewWidth(10));
            make.top.mas_equalTo(self).offset(kGetViewWidth(10));
        }];
        view.font = [UIFont systemFontOfSize:kFont(11)];
        view;
    });
    
    self.commentLb = ({
        UILabel *view = [[UILabel alloc]init];
        [self addSubview:view];
        @weakify(self);
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            @strongify(self);
            make.top.mas_equalTo(self.starView.mas_bottom).offset(kGetViewHeight(8));
            make.left.mas_equalTo(self).offset(kGetViewWidth(10));
            make.right.mas_equalTo(self).offset(kGetViewWidth(-10));
        }];
        view.font = [UIFont systemFontOfSize:kFont(12)];
        view.numberOfLines = 0;
        view;
    });
    
    UIImageView *lastImgView ;
    for (int i = 0; i < 3; i++) {
        UIImageView *imgView = ({
            UIImageView *view = [[UIImageView alloc]init];
            [self addSubview:view];
            @weakify(self);
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                @strongify(self);
                if (i == 0) {
                    make.left.mas_equalTo(self).offset(kGetViewWidth(10));
                }else{
                    make.left.mas_equalTo(lastImgView.mas_right).offset(kGetViewWidth(10));
                }
                make.top.mas_equalTo(self.commentLb.mas_bottom).offset(kGetViewHeight(10));
                make.width.mas_equalTo(kGetViewWidth(80));
                make.height.mas_equalTo(kGetViewHeight(80));
                make.bottom.mas_equalTo(self).offset(kGetViewHeight(-10));
            }];
            view;
        });
        [self.imgArray addObject:imgView];
        lastImgView = imgView;
    }
}


-(void)setDic:(NSDictionary *)dic{
    _dic = dic;
    /**
     *  评分
     */
    NSNumber *score = dic[@"score"];
    self.starView.score = score.integerValue;
    
    /**
     *  用户名
     */
    self.userNameLb.text = dic[@"userName"];
    /**
     *  评论内容
     */
    self.commentLb.text = dic[@"content"];
    /**
     *  图片分析
     */
    NSNumber *isHaveImgs = dic[@"isHaveImgs"];
    if (isHaveImgs.boolValue) {
        [self.commentLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self).offset(kGetViewHeight(-10));
        }];
        return;
    }
    NSArray *array = dic[@"imgs"];
    for (int i = 0;i < array.count;i++) {
        Pictureinfolist *piclist = array[i];
        UIImageView *imgView = self.imgArray[i];
        [imgView sd_setImageWithURL:[NSURL URLWithString:piclist.picURL]];
    }
}

#pragma mark - 懒加载
- (NSMutableArray *)imgArray {
    if(_imgArray == nil) {
        _imgArray = [[NSMutableArray alloc] init];
    }
    return _imgArray;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}





@end
