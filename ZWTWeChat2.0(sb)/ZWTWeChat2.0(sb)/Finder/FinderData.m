//
//  FinderData.m
//  ZWTWeChat2.0(sb)
//
//  Created by 钟文韬 on 2021/5/6.
//

#import "FinderData.h"

@implementation FinderData

+ (instancetype)finderDatawithDict:(NSDictionary *)dict{
    FinderData *Data = [self new];
    [Data setValuesForKeysWithDictionary:dict];
    return Data;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
}
@end
