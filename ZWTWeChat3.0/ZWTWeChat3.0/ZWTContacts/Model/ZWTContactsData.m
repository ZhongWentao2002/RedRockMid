//
//  ZWTContactsData.m
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/5/13.
//

#import "ZWTContactsData.h"

@implementation ZWTContactsData
+ (instancetype)ContactsDatawithDict:(NSDictionary *)dict{
    //新建模型对象
    ZWTContactsData *Data = [self new];
    //KVC
    [Data setValuesForKeysWithDictionary:dict];
    return Data;
}


///防崩溃
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
}

@end
