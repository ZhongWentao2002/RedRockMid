//
//  ZWTPYQData.h
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/6/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZWTPYQData : NSObject

@property (nonatomic,copy) NSString *mianTextLbl; //动态文字
@property (nonatomic,copy) NSString *Users; //用户名
@property (nonatomic,strong) NSNumber *photo_count; //图片数量
@property (nonatomic,assign) int tag; //tag
@property (nonatomic,assign) int commentCount;//评论数量
@property (nonatomic,strong) NSMutableArray *commenttextAry;//可变评论数组
@property (nonatomic,strong) NSArray *currentcommentAry;
///字典转模型
+(instancetype)PYQDatawithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
