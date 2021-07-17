//
//  ZWTFabuVC.h
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/6/22.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface ZWTFabuVC : UIViewController
///发布界面选择的图片数组
@property (nonatomic,strong) NSMutableArray *photoAry;
///用来返回数据的 Block
@property (nonatomic, copy) void (^getData)(NSArray *array,NSString *text);
@end

NS_ASSUME_NONNULL_END
