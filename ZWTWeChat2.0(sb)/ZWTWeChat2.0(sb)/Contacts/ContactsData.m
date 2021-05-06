//
//  ContactsData.m
//  ZWTWeChat2.0(sb)
//
//  Created by 钟文韬 on 2021/5/6.
//

#import "ContactsData.h"

@implementation ContactsData
+ (instancetype)ContactsDatawithDict:(NSDictionary *)dict{
    ContactsData *Data = [self new];
    [Data setValuesForKeysWithDictionary:dict];
    return Data;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
}
@end
