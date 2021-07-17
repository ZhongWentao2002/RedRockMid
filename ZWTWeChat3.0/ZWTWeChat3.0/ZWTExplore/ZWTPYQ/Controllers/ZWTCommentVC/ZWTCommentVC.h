//
//  ZWTCommentVC.h
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/7/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface ZWTCommentVC : UIViewController <UITextViewDelegate>
- (IBAction)cancel:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *Fabiao;
///文本框
@property (nonatomic,strong) UITextView *textView;
///placeholder
@property (nonatomic,strong) UILabel *placeholder;
@property (copy,nonatomic) void(^block)(void);


@end

NS_ASSUME_NONNULL_END
