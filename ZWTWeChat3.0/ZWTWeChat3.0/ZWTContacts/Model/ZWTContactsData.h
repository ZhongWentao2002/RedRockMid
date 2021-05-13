//
//  ZWTContactsData.h
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/5/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZWTContactsData : NSObject
@property (nonatomic,copy) NSString *contactImage;
@property (nonatomic,copy) NSString *contactName;

+ (instancetype)ContactsDatawithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
