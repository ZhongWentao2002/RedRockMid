//
//  ZWTContactsData.m
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/5/13.
//

#import "ZWTContactsData.h"

@implementation ZWTContactsData
+ (instancetype)ContactsDatawithDict:(NSDictionary *)dict{
    ZWTContactsData *Data = [self new];
    [Data setValuesForKeysWithDictionary:dict];
    return Data;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
}

@end
