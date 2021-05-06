//
//  FinderData.h
//  ZWTWeChat2.0(sb)
//
//  Created by 钟文韬 on 2021/5/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FinderData : NSObject

@property (nonatomic,copy) NSString *image_count;
@property (nonatomic,copy) NSString *text;
@property (nonatomic,copy) NSString *image;
@property (nonatomic,copy) NSString *time;

+ (instancetype)finderDatawithDict:(NSDictionary *)dict;


@end

NS_ASSUME_NONNULL_END
