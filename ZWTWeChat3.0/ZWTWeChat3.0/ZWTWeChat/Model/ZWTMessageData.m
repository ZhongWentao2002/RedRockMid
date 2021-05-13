//
//  ZWTMessageData.m
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/5/13.
//

#import "ZWTMessageData.h"

@implementation ZWTMessageData

+ (instancetype)MessageDatawithDict:(NSDictionary *)dict{
    ZWTMessageData *message = [self new];
    [message setValuesForKeysWithDictionary:dict];
    return message;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
}

@end
