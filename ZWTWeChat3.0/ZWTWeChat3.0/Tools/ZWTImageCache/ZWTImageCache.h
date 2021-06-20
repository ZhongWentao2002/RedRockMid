//
//  ZWTImageCache.h
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/6/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 自定义缓存图片工具，基于 NSFileManager
 */
@interface ZWTImageCache : NSObject
///存储图片到本地
- (void)storeImage:(NSData *)imageData withImageName:(NSString *)ImageName;
/// 获取本地图片
- (NSData *)getImageWithImageName:(NSString *)ImageName;
///删除本地图片
- (void)deleteImageWithImageName:(NSString *)ImageName;

@end

NS_ASSUME_NONNULL_END
