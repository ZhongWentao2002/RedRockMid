//
//  MessageData.m
//  ZWTWeChat2.0(sb)
//
//  Created by 钟文韬 on 2021/5/5.
//

#import "MessageData.h"

@implementation MessageData
+ (instancetype)MessageDatawithDict:(NSDictionary *)dict{
    MessageData *message = [self new];
    [message setValuesForKeysWithDictionary:dict];
    return message;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
}
@end
