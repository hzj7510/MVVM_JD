//
//  ProductCommentModel.m
//  IOSProjectInit
//
//  Created by mac on 17/3/30.
//  Copyright © 2017年 x5. All rights reserved.
//

#import "ProductCommentModel.h"

@implementation ProductCommentModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

+ (NSDictionary *)objectClassInArray{
    return @{@"questionList" : [Questionlist class], @"commentInfoList" : [Commentinfolist class]};
}
@end
@implementation Questionlist
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
+ (NSDictionary *)objectClassInArray{
    return @{@"answerList" : [Answerlist class]};
}

@end


@implementation Answerlist
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end


@implementation Commentinfolist
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
+ (NSDictionary *)objectClassInArray{
    return @{@"wareAttribute" : [Wareattribute class], @"pictureInfoList" : [Pictureinfolist class]};
}

@end


@implementation Aftercomment
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end


@implementation Wareattribute
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end


@implementation Pictureinfolist
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end


