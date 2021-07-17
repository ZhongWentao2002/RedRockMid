//
//  MyTableViewCell4.h
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/6/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyTableViewCell4 : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *userlbl;
@property (strong, nonatomic) IBOutlet UILabel *maintextlbl;
@property (strong, nonatomic) IBOutlet UIImageView *img1;
@property (strong, nonatomic) IBOutlet UIImageView *img2;
@property (strong, nonatomic) IBOutlet UIImageView *img3;
@property (strong, nonatomic) IBOutlet UIImageView *img4;
@property (strong, nonatomic) IBOutlet UIImageView *img5;
@property (strong, nonatomic) IBOutlet UIImageView *img6;
@property (copy,nonatomic) void(^block)(void);
- (IBAction)CommentBtn:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
