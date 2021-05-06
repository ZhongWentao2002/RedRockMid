//
//  MessageData.h
//  ZWTWeChat2.0(sb)
//
//  Created by 钟文韬 on 2021/5/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MessageData : NSObject

@property (nonatomic,copy) NSString *contacts;
@property (nonatomic,copy) NSString *contactsImage;
@property (nonatomic,copy) NSString *information;
@property (nonatomic,copy) NSString *time;

+ (instancetype)MessageDatawithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
