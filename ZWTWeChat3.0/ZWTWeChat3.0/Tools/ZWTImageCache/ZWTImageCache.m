//
//  ZWTImageCache.m
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/6/20.
//

#import "ZWTImageCache.h"

@implementation ZWTImageCache

- (void)storeImage:(NSData *)imageData withImageName:(NSString *)ImageName{
    
    if (imageData && ImageName.length > 0 && ImageName) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        
        NSString *documentsDirectory = [paths objectAtIndex:0];
        
        NSString *createPath = [NSString stringWithFormat:@"%@/Images",documentsDirectory];
        
        if (![fileManager fileExistsAtPath:createPath]) {
            [fileManager createDirectoryAtPath:createPath withIntermediateDirectories:YES attributes:nil error:nil];
            NSLog(@"已创建文件夹");
        }
        
        NSString *filePath = [NSString stringWithFormat:@"%@/%@.png",createPath,ImageName];
        
        [[NSFileManager defaultManager] createFileAtPath:filePath contents:imageData attributes:nil];
        
    
    
    
    }
    
    
}

- (NSData *)getImageWithImageName:(NSString *)ImageName{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *filePath = [NSString stringWithFormat:@"%@/Images/%@.png",documentsDirectory,ImageName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSData *imageData;
    
    if ([fileManager fileExistsAtPath:filePath]) {
        imageData = [NSData dataWithContentsOfFile:filePath];
    }
    
    return imageData;
}

- (void)deleteImageWithImageName:(NSString *)ImageName{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *filePath = [NSString stringWithFormat:@"%@/Images/%@.png",documentsDirectory,ImageName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    [fileManager removeItemAtPath:filePath error:nil];
}

@end
