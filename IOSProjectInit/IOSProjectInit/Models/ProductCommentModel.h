//
//  ProductCommentModel.h
//  IOSProjectInit
//
//  Created by mac on 17/3/30.
//  Copyright © 2017年 x5. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Questionlist,Answerlist,Commentinfolist,Aftercomment,Wareattribute,Pictureinfolist;
@interface ProductCommentModel : NSObject

@property (nonatomic, copy) NSString *goodRate;

@property (nonatomic, copy) NSString *pictureCnt;

@property (nonatomic, assign) BOOL canConsultFlag;

@property (nonatomic, copy) NSString *badCnt;

@property (nonatomic, copy) NSString *goodCnt;

@property (nonatomic, copy) NSString *allCnt;

@property (nonatomic, copy) NSString *noQuestionText;

@property (nonatomic, strong) NSArray<Questionlist *> *questionList;

@property (nonatomic, strong) NSArray *commentVideoInfoList;

@property (nonatomic, copy) NSString *code;

@property (nonatomic, copy) NSString *showPicCnt;

@property (nonatomic, copy) NSString *normalCnt;

@property (nonatomic, strong) NSArray *tagStatisticsinfoList;

@property (nonatomic, copy) NSString *consultationCount;

@property (nonatomic, copy) NSString *commentButtonText;

@property (nonatomic, strong) NSArray<Commentinfolist *> *commentInfoList;

@end
@interface Questionlist : NSObject

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, strong) NSArray<Answerlist *> *answerList;

@end

@interface Answerlist : NSObject

@property (nonatomic, copy) NSString *content;

@end

@interface Commentinfolist : NSObject

@property (nonatomic, copy) NSString *orderDate;

@property (nonatomic, strong) NSArray<Wareattribute *> *wareAttribute;

@property (nonatomic, copy) NSString *commentId;

@property (nonatomic, copy) NSString *commentDate;

@property (nonatomic, copy) NSString *commentType;

@property (nonatomic, copy) NSString *praiseCnt;

@property (nonatomic, strong) Aftercomment *afterComment;

@property (nonatomic, copy) NSString *noCommentMessage;

@property (nonatomic, copy) NSString *userImgURL;

@property (nonatomic, copy) NSString *commentScore;

@property (nonatomic, copy) NSString *plusAvailable;

@property (nonatomic, copy) NSString *userLevel;

@property (nonatomic, copy) NSString *replyCnt;

@property (nonatomic, copy) NSString *guid;

@property (nonatomic, copy) NSString *commentData;

@property (nonatomic, copy) NSString *commentShareUrl;

@property (nonatomic, strong) NSArray<Pictureinfolist *> *pictureInfoList;

@property (nonatomic, copy) NSString *userNickName;

@property (nonatomic, copy) NSString *plusAddress;

@end

@interface Aftercomment : NSObject

@end

@interface Wareattribute : NSObject

@property (nonatomic, copy) NSString *颜色;

@end

@interface Pictureinfolist : NSObject

@property (nonatomic, copy) NSString *picURL;

@property (nonatomic, copy) NSString *largePicURL;

@end

