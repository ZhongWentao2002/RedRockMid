//
//  ZWTMessageData.h
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/5/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

///消息模型
@interface ZWTMessageData : NSObject

///消息来源
@property (nonatomic,copy) NSString *contacts;
///消息头像
@property (nonatomic,copy) NSString *contactsImage;
///最新消息
@property (nonatomic,copy) NSString *information;
///时间
@property (nonatomic,copy) NSString *time;


///字典转模型 参数dict:传入的字典
+(instancetype)MessageDatawithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
