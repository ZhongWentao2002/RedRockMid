//
//  ZWTPYQData.h
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/6/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZWTPYQData : NSObject

@property (nonatomic,copy) NSString *mianTextLbl;
@property (nonatomic,copy) NSString *Users;
@property (nonatomic,strong) NSNumber *photo_count;
@property (nonatomic,assign) int tag;

+(instancetype)PYQDatawithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
