//
//  ZWTMessageCell.h
//  ZWTWeChat3.0
//
//  Created by 钟文韬 on 2021/5/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZWTMessageCell : UITableViewCell

///消息头像
@property (strong, nonatomic) IBOutlet UIImageView *image;
///消息来源
@property (strong, nonatomic) IBOutlet UILabel *contact;
///最后一条消息
@property (strong, nonatomic) IBOutlet UILabel *information;
///时间
@property (strong, nonatomic) IBOutlet UILabel *time;


@end

NS_ASSUME_NONNULL_END
