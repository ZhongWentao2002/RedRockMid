//
//  ContactsData.h
//  ZWTWeChat2.0(sb)
//
//  Created by 钟文韬 on 2021/5/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ContactsData : NSObject

@property (nonatomic,copy) NSString *contactImage;
@property (nonatomic,copy) NSString *contactName;

+ (instancetype)ContactsDatawithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
