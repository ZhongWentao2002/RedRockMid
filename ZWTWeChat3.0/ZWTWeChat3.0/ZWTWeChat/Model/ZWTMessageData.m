//
//  ZWTMessageData.m
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/5/13.
//

#import "ZWTMessageData.h"

@implementation ZWTMessageData

+ (instancetype)MessageDatawithDict:(NSDictionary *)dict{
    //新建模型对象
    ZWTMessageData *message = [self new];
    //KVC
    [message setValuesForKeysWithDictionary:dict];
    return message;
}
//防崩溃
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
}

@end
