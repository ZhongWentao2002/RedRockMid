//
//  ZWTPYQData.m
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/6/24.
//

#import "ZWTPYQData.h"

@implementation ZWTPYQData

+ (instancetype)PYQDatawithDict:(NSDictionary *)dict{
    ZWTPYQData *data = [self new];
    [data setValuesForKeysWithDictionary:dict];
    return data;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
}

@end
