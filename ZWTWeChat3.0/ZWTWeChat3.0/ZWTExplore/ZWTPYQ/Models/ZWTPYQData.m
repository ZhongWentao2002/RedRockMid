//
//  ZWTPYQData.m
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/6/24.
//

#import "ZWTPYQData.h"

@implementation ZWTPYQData

+ (instancetype)PYQDatawithDict:(NSDictionary *)dict{
    //新建模型对象
    ZWTPYQData *data = [self new];
    data.commentCount = 0;
    //KVC
    [data setValuesForKeysWithDictionary:dict];
    return data;
}
//防崩溃
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
}

@end
