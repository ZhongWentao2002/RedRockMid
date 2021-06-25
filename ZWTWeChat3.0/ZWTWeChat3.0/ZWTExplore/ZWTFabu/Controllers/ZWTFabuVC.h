//
//  ZWTFabuVC.h
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/6/22.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface ZWTFabuVC : UIViewController

@property (nonatomic,strong) NSMutableArray *photoAry;
@property (nonatomic, copy) void (^getData)(NSArray *array,NSString *text);
@end

NS_ASSUME_NONNULL_END
