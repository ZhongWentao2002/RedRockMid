//
//  ZWTContactsData.h
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/5/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

///联系人模型
@interface ZWTContactsData : NSObject
///联系人头像
@property (nonatomic,copy) NSString *contactImage;
///联系人名字
@property (nonatomic,copy) NSString *contactName;


///字典转模型
+ (instancetype)ContactsDatawithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
